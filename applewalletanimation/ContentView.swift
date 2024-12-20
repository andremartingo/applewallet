//
//  ContentView.swift
//  applewalletanimation
//
//  Created by André Martingo on 20/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State
    var currentPass: Pass?
    
    @State
    var showDetailCard: Bool = false
    
    @Namespace
    var animation
    
    var body: some View {
        NavigationStack {
            VStack {
                header
                    .padding()
                
                GeometryReader { proxy in
                    ScrollView {
                        ZStack(alignment: .top) {
                            ForEach(0..<passes.count, id: \.self) { index in
                                let item = passes[index]
                                
                                PassView(pass: item, index: index)
                                    .matchedGeometryEffect(id: item.id, in: animation)
                                    .onTapGesture {
                                        withAnimation(.easeInOut(duration: 0.35)) {
                                            currentPass = item
                                            showDetailCard = true
                                        }
                                    }
                            }
                        }
                        .padding(16)
                        .shadow(color: .black.opacity(0.20), radius: 10, x: 4, y: 4)
                        .padding(.top, UIDevice.current.userInterfaceIdiom == .pad ? 0 : -32)
                    }
                }
            }
            .overlay {
                if let pass = currentPass, showDetailCard {
                    DetailView(currentPass: pass, showDetailCard: $showDetailCard, animation: animation)
                }
            }
        }
    }
    
    @ViewBuilder
    func PassView(pass: Pass, index: Int)->some View {
        Image(uiImage: pass.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 500)
            .stacked(at: index)
    }
    
    var header: some View {
        HStack {
            Text("Wallet")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Spacer()
            
            Button(action: {}, label: {
                ZStack {
                    Circle()
                        .frame(width: 33, height: 33)
                        .foregroundColor(Color(.secondarySystemBackground))
                    
                    Image(systemName: "gear")
                        .font(.title2)
                        .foregroundColor(Color.blue)
                }
                .contentShape(Circle())
                .hoverEffect(.lift)
            })
            
            Button(action: {}, label: {
                ZStack {
                    Circle()
                        .frame(width: 33, height: 33)
                        .foregroundColor(Color.blue)
                    
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundColor(Color(.secondarySystemBackground))
                }
                .contentShape(Circle())
                .hoverEffect(.lift)
            })
        }
    }
}

struct DetailView: View{
    var currentPass: Pass
    
    @Binding var showDetailCard: Bool
    
    // Matched Geometry Effect
    var animation: Namespace.ID
    
    // Delaying Expenses View
    @State var showExpenseView: Bool = false
            
    var body: some View {
        VStack {
            PassView(pass: currentPass, index: 0)
                .matchedGeometryEffect(id: currentPass.id, in: animation)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.35)) {
                        showDetailCard = false
                    }
                }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground).ignoresSafeArea())
    }
    
    
    @ViewBuilder
    func PassView(pass: Pass, index: Int)->some View {
        Image(uiImage: pass.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 500)
            .stacked(at: index)
    }
}


extension View {
    func stacked(at position: Int) -> some View {
        return self.padding(.top, CGFloat(position * 80))
    }
}

#Preview {
    ContentView()
}
