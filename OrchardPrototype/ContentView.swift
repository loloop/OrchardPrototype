//
//  ContentView.swift
//  OrchardPrototype
//
//  Created by Mauricio Cardozo on 12/5/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import SwiftUI
import UIKit
import WebKit

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

            JobsView().tabItem({
                VStack {
                    Image(systemName: "doc.text.fill")
                        .imageScale(.large)
                        .accentColor(Color.primary)
                    Text("Vagas")
                }
            })

            VideosView().tabItem({
                VStack {
                    Image(systemName: "video.fill")
                        .imageScale(.large)
                        .accentColor(Color.primary)
                    Text("Vídeos")
                }
            })

            ProfileView().tabItem({
                VStack {
                    Image(systemName: "person.fill")
                        .imageScale(.large)
                        .accentColor(Color.primary)
                    Text("Perfil")
                }
            })

        }
    }
}

struct NewsView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    OrganizerQuickButtons()
                    OrganizerAreaButton()
                    EventReminder()
                    TitleSubtitleView()
                    TalkSpotlightView()
                }
            }.navigationBarTitle(Text("Olá, Mauricio"))
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

struct JobsView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    WarningView()
                    List {
                        JobOpeningButton()
                        JobOpeningButton()
                        JobOpeningButton()
                        JobOpeningButton()
                        JobOpeningButton()
                        JobOpeningButton()
                        JobOpeningButton()
                        JobOpeningButton()
                        JobOpeningButton()
                        JobOpeningButton()
                    }.frame(minHeight: 500, maxHeight: .infinity, alignment: .center)
                }
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .navigationBarTitle(Text("Vagas"))
        }
    }
}

struct WarningView: View {
    var body: some View {
        CardView {
            VStack {
                Text("Quer ver a sua vaga aqui?")
                Text("Cadastre-a em nosso repositório de vagas no GitHub. Veja como aqui")
            }.padding()
        }
    }
}

struct JobOpeningButton: View {
    var body: some View {
        NavigationLink(destination: WebView().navigationBarTitle(Text("Vaga"), displayMode: .inline)) {
            Text("Vaga").padding()
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: URL = URL(string: "https://github.com/CocoaHeadsBrasil/vagas/issues/705")!

    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(urlRequest(url))
    }

    func urlRequest(_ url: URL) -> URLRequest {
        return URLRequest(url: url)
    }
}


struct VideosView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    TalkSpotlightView()
                    VideoFilterButton(title: "Favoritos")
                    VideoFilterButton(title: "Por capítulo")
                    HStack {
                        Text("Buscar")
                        Spacer()
                        Image(systemName: "magnifyingglass")
                    }.padding().background(Color.gray.opacity(0.5)).cornerRadius(10).padding()
                    Text("Recentes").asLargeTitle().frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    TalkSpotlightView()
                    TalkSpotlightView()
                    TalkSpotlightView()
                    TalkSpotlightView()
                }
            }.navigationBarTitle(Text("Videos"))
        }
    }
}

struct VideoFilterButton: View {

    let title: String

    var body: some View {
        Group {
            HStack {
                Text(title).linkStyle()
                Spacer()
                Image(systemName: "chevron.right")
            }.padding(.horizontal)
            Divider()
        }
    }
}

struct ProfileView: View {
    var body: some View {
        Text("perfil mas ainda n tem nada aqui")
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
        .background(Color(UIColor.quaternarySystemFill))
        .cornerRadius(8)
        .padding(10)
    }
}

struct OrganizerQuickButtons: View {
    var body: some View {
        HStack {
            CardView {
                VStack {
                    Spacer().frame(height: 10, alignment: .center)
                    Image(systemName: "calendar.badge.plus")
                        .imageScale(.large)
                    Text("Agenda")
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .padding()
            }
            CardView {
                VStack {
                    Spacer().frame(height: 10, alignment: .center)
                    Image(systemName: "video.badge.plus")
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
                    .foregroundColor(Color.primary)
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
                    .frame(minHeight: 0, maxHeight: 70, alignment: .center)
                Text("Fique de olho nas suas notificações! Quem sabe você não ganha alguma coisa? :)")
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .padding(10)
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

    func linkStyle() -> some View {
        self.foregroundColor(.accentColor).font(.system(size: 25))
    }
}

struct FilterView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Text("Todos").buttonlike().background(Color.blue)
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
            JobsView()
            VideosView()
            ProfileView()
        }
    }
}
