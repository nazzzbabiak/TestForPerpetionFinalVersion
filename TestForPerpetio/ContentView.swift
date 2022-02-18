//
//  ContentView.swift
//  TestForPerpetio
//
//  Created by Nazar Babyak on 15.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel(networkManager: NetworkManager())
    @State var backgroundColor: Color = Color.black
    
    var body: some View {
        NavigationView {
            VStack{
                
                ScrollView {
                    HStack{
                        ScrollViewText(backgroundColor: $backgroundColor)
                            .shadow(color: .gray, radius: 2, x: 2, y: 2)
                    }
                    Spacer(minLength: 15)
                    HStack{
                        Rectangle()
                            .fill(Color.white)
                            .frame(height: 1)
                        Text("Text")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        Rectangle()
                            .fill(Color.white)
                            .frame(height: 1)
                    }
                    .padding()
                    Spacer(minLength: 15)
                    ForEach(viewModel.posts, id: \.self) { post in
                        NavigationLink(destination: {
                            ZStack{
                                VStack{
                                    Text(post.title)
                                        .font(.title2)
                                        .foregroundColor(Color.white)
                                        .frame(maxWidth: .infinity)
                                        .padding(.horizontal)
                                        .padding(.vertical)
                                        .padding()
                                        .background(backgroundColor)
                                        .cornerRadius(5)
                                        .contextMenu(menuItems: {
                                            SomethingButton(backgroundColor: $backgroundColor)
                                        })
                                    
                                    Text(post.body)
                                        .font(.body)
                                        .foregroundColor(Color("ColorText"))
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .padding()
                                        .background(Color("ColorOne"))
                                        .cornerRadius(5)
                                    Spacer()
                                    
                                }
                                .shadow(color: .gray, radius: 2, x: 3, y: 3)
                                .padding(5)
                            }
                            .navigationTitle("Title & Body")
                        }, label: {
                            VStack{
                                HStack{
                                    Text(post.title)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right.circle.fill")
                                }
                                .foregroundColor(Color.black.opacity(0.8))
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 5 )
                                .padding()
                                .background(Color.white)
                                .cornerRadius(5)
                                
                            }
                            .foregroundColor(Color.black.opacity(0.5))
                        })
                            .padding()
                    }
                }
                .background(Color.black.opacity(0.11))
            }
            .navigationTitle( Text("TestForPerpetio"))
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarItems(leading: PersoneView(), trailing: ExitProgram())
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //        ContentView()
        //            .colorScheme(.dark)
        
    }
}


struct ScrollViewText: View {
    
    @Binding var backgroundColor: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Text")
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(backgroundColor)
                .shadow(color: Color.gray, radius: 2, x: 2, y: 2)
                .cornerRadius(5)
            ScrollView(.horizontal, showsIndicators: true, content: {
                HStack{
                    
                    ForEach(0..<10) { index in
                        
                        VStack {
                            MoreImage()
                            MoreInfo()
                        }
                        
                    }
                }
                .padding(5)
            })
        }
        .padding(5)
    }
}

struct MoreImage: View {
    var body: some View {
        NavigationLink(destination: {
            Image("aaa")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea(.all)
        }, label: {
            Image("aaa")
                .resizable()
                .frame(width: 200, height: 300)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(5)
                .shadow(color: .gray.opacity(0.33), radius: 2, x: 2, y: 2)
        })
        
    }
}

struct MoreInfo: View {
    var body: some View {
        NavigationLink(destination: {
            Text("There is more Info")
            
            Spacer()
        }, label: {
            Text("Text")
            
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .border(Color.black, width: 2)
                .background(Color.white)
                .shadow(color: .gray.opacity(0.33), radius: 2, x: 2, y: 2)
                .cornerRadius(5)
        })
    }
}

struct SomethingButton: View {
    
    @Binding var backgroundColor: Color
    
    var body: some View {
        VStack{
            Button(action: {
                backgroundColor = .red
            }, label: {
                
                HStack {
                    Text("Change to red")
                    
                    Spacer()
                    
                    Image(systemName: "paintpalette")
                    
                }
                .foregroundColor(.red)
            })
            Button(action: {
                backgroundColor = .orange
            }, label: {
                HStack {
                    Text("Change to orange")
                    
                    Spacer()
                    
                    Image(systemName: "paintpalette")
                    
                }
                .foregroundColor(.orange)
            })
            
            Button(action: {
                backgroundColor = .gray
            }, label: {
                HStack {
                    
                    Text("Change to gray")
                    Spacer()
                    Image(systemName: "paintpalette")
                    
                }
                .foregroundColor(.gray)
            })
            
            Button(action: {
                backgroundColor = .purple
            }, label: {
                HStack {
                    Text("Change to purple")
                    
                    Spacer()
                    
                    Image(systemName: "paintpalette")
                    
                }
                .foregroundColor(.purple)
            })
        }
    }
}

struct PersoneMenu: View {
    var body: some View {
        VStack{
            ZStack{
                HStack{
                    VStack(alignment: .leading, spacing: 55, content: {
                        Button(action: {
                            
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title)
                        }
                        Text("Settings")
                            .font(.largeTitle)
                    }) .foregroundColor(Color.black.opacity(0.5))
                    Spacer()
                }
                .padding()
                .padding(.top,10)
                VStack{
                    
                    Image("settings")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                    Spacer()
                    
                }
                
            }
            .frame(height: 175)
            
            VStack{
                List {
                    SomeElements(image: "settings", text: "Setting One")
                    
                    SomeElements(image: "settings", text: "Setting Two")
                    
                    SomeElements(image: "settings", text: "Setting Three")
                    
                    SomeElements(image: "settings", text: "Setting Four")
                    
                    SomeElements(image: "settings", text: "Setting Five")
                    
                    SomeElements(image: "settings", text: "Setting Six")
                    
                    SomeElements(image: "settings", text: "Setting Seven")
                    
                    SomeElements(image: "settings", text: "Setting Eight")
                    
                    SomeElements(image: "settings", text: "Setting Nine")
                    
                    SomeElements(image: "settings", text: "Setting Ten")
                    
                }
            }
            
            Spacer()
            
        }
    }
}

struct SomeElements: View {
    
    @State var image: String = ""
    @State var text: String = ""
    
    var body: some View {
        
        Button(action: {
            
        }, label: {
            
            HStack(spacing: 25) {
                
                Image(image)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 45, height: 45)
                Text(text)
                
                Spacer(minLength: 20)
                
                Image(systemName: "chevron.right.circle.fill")
                
            }
            .accentColor(.black.opacity(0.5))
            .padding()
            
        })
    }
}


struct ExitProgram: View {
    var body: some View {
        NavigationLink(destination: {
            Text("Text")
            Spacer()
            
        }, label: {
            Image(systemName: "xmark")
                .resizable()
                .frame(width: 25, height: 25)
            
        })
    }
}


struct PersoneView: View {
    var body: some View {
        NavigationLink(destination: {
            PersoneMenu()
            
        }, label: {
            
            Image(systemName: "slider.horizontal.3")
                .resizable()
                .frame(width: 25, height: 25)
            
        })
    }
}
