//
//  ContentView.swift
//  Dating
//
//  Created by Albert Khurshudyan on 17.12.23.
//

import SwiftUI

struct ContentView: View {
    @State private var cardRemovalTransition = AnyTransition.trailingButton
    @State private var lastCardIndex: Int = 1
    @State var showAlert: Bool = false
    @State var showGuide: Bool = false
    @State var showInfo: Bool = false
    @GestureState private var dragState = DragState.inactive
    
    private var dragAreaThreshould: CGFloat = 65.0
    
    @State var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2 {
            views.append(CardView(blackDating: blackDatingData[index]))
        }
        return views
    }()
    
    private func moveCards() {
        cardViews.removeFirst()
        
        self.lastCardIndex += 1
        
        let blackDates = blackDatingData[lastCardIndex % blackDatingData.count]
        
        let newCardView = CardView(blackDating: blackDates)
        
        cardViews.append(newCardView)
    }
    
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
            return false
        }
        return index == 0
    }
    
    var body: some View {
        VStack {
            HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)
            
            Spacer()
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                    .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                    .overlay(
                        ZStack{
                            Image(systemName: "x.circle")
                                .modifier(SymbolModifier())
                                .opacity(self.dragState.translation.width < -self.dragAreaThreshould && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                            
                            Image(systemName: "heart.circle")
                                .modifier(SymbolModifier())
                                .opacity(self.dragState.translation.width > self.dragAreaThreshould && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                        }
                    )
                    .offset(x:
                            self.isTopCard(cardView: cardView) ?
                            self.dragState.translation.width : 0,
                            y:
                            self.isTopCard(cardView: cardView) ?
                            self.dragState.translation.height : 0)
                    .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ? Double(self.dragState.translation.width / 12) : 0))
                    .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.85 : 1.0)
                    .animation(.interpolatingSpring(stiffness: 120, damping: 120), value: dragState.isDragging)
                    .gesture(LongPressGesture(minimumDuration: 0.01)
                        .sequenced(before: DragGesture())
                        .updating(self.$dragState, body: { (value, state, translation) in
                            switch value {
                            case .first(true):
                                state = DragState.pressing
                            case .second(true, let drag):
                                state = DragState.dragging(translation: drag?.translation ?? .zero)
                            default:
                                break
                            }
                        })
                            .onChanged({ (value) in
                                guard case .second(true, let drag?) = value else {
                                    return
                                }
                                
                                if drag.translation.width < -self.dragAreaThreshould {
                                    self.cardRemovalTransition = .leadingButton
                                }
                                
                                if drag.translation.width > self.dragAreaThreshould {
                                    self.cardRemovalTransition = .trailingButton
                                }
                                
                            })
                        .onEnded({(value) in
                            guard case .second(true, let drag?)  = value else {
                                return
                            }
                            
                            if drag.translation.width < -self.dragAreaThreshould ||
                                drag.translation.width > self.dragAreaThreshould {
                                self.moveCards()
                            }
                        })
                    ).transition(self.cardRemovalTransition)
                }
            }
            .padding(.vertical)
            
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("SUCCESS"), message: Text("MATCH"),
                  dismissButton: .default(Text("Happy Dating.")))
        })
    }
}

#Preview {
    ContentView()
}
