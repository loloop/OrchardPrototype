//
//  ContentView.swift
//  OrchardPrototype
//
//  Created by Mauricio Cardozo on 12/5/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NewsView().tabItem({
                VStack {
                    Image(systemName: "house.fill")
                        .imageScale(.large)
                        .accentColor(Color.primary)
                    Text("Noticias")
                }
            })

            EventsView().tabItem({
                VStack {
                    Image(systemName: "square.fill.on.square.fill")
                        .imageScale(.large)
                        .accentColor(Color.primary)
                    Text("Eventos")
                }
            })

        }
    }
}

struct NewsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Olá, Mauricio")
                    .asLargeTitle()
                OrganizerQuickButtons()
                OrganizerAreaButton()
                EventReminder()
                TitleSubtitleView()
                TalkSpotlightView()
            }
        }
    }
}

struct EventsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Meu último evento").asLargeTitle()
                EventView()
                Text("Filtrar por capítulo").asLargeTitle()
                FilterView()
                Text("Próximos eventos").asLargeTitle()
                EventView()
                EventView()
                Text("Eventos passados").asLargeTitle()
                EventView()
                EventView()
            }
        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
    }
}

struct CardView<Content>: View where Content: View {

    let content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        Group {
            content()
        }
        .background(Color(UIColor.tertiarySystemBackground))
        .cornerRadius(8)
        .padding()
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
    }
}

struct OrganizerQuickButtons: View {
    var body: some View {
        HStack {
            CardView {
                VStack {
                    Image(systemName: "house.fill")
                        .imageScale(.large)
                    Text("Agenda")
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .padding()
            }
            CardView {
                VStack {
                    Image(systemName: "house.fill")
                        .imageScale(.large)
                    Text("Vídeo")
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .padding()
            }
        }
    }
}

struct OrganizerAreaButton: View {
    var body: some View {
        CardView {
            Text("Área do Organizador")
                .fontWeight(.bold)
                .font(.title)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100, alignment: .leading)
                .padding()
        }
    }
}

struct EventReminder: View {
    var body: some View {
        CardView {
            VStack(spacing: 15) {
                Text("Hoje tem CocoaHeads!")
                    .fontWeight(.medium)
                    .font(.title)
                Text("Vai ser as 19:00, na PeixeUrbano")
                Button(action: {}) {
                    Text("Veja como chegar lá")
                }
                    .accentColor(Color.black)
                    .padding()
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(10)
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .padding()
        }
    }
}

struct TalkSpotlightView: View {
    var body: some View {
        CardView {
            VStack(alignment: .leading) {
                Text("Compartilhando código através do oceano!")
                    .fontWeight(.medium)
                    .font(.title)
                Spacer()
                Text("49º CocoaHeads SP @ Farfetch")
                    .padding(5)
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(5)

            }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 250, alignment: .leading)
                .padding()
                .background(Color.pink.opacity(0.1))
        }
    }
}

struct TitleSubtitleView: View {
    var body: some View {
        CardView {
            VStack(alignment: .leading, spacing: 15) {
                Text("Obrigado por participar do CocoaHeads SP!")
                    .fontWeight(.medium)
                    .font(.title)
                Text("Fique de olho nas suas notificações! Quem sabe você não ganha alguma coisa? :)")
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .padding()
        }
    }
}

struct EventView: View {
    var body: some View {
        CardView {
            VStack(alignment: .leading) {
                Text("49º CocoaHeads SP")
                    .asTitle()
                Text("Farfetch")
                    .font(.callout)
                Spacer()
                Text("São Paulo").buttonlike()

            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 150, alignment: .leading)
            .padding()
        }
    }
}

extension Text {
    func asLargeTitle() -> some View {
        self.font(.largeTitle)
            .fontWeight(.bold)
            .padding(.horizontal, 15)
    }

    func asTitle() -> some View {
        self.fontWeight(.medium)
        .font(.title)
    }

    func buttonlike() -> some View {
        self.padding(5)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(5)
    }
}

struct FilterView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Text("São Paulo").buttonlike()
                Text("Campinas").buttonlike()
                Text("Curitiba").buttonlike()
                Text("Florianópolis").buttonlike()
                Text("Belo Horizonte").buttonlike()
                Text("Fortaleza").buttonlike()
                Text("João Pessoa").buttonlike()
            }.padding(.horizontal, 15)
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            EventsView()
        }
    }
}
