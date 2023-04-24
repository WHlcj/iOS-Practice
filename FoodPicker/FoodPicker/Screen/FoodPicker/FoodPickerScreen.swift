//
//  ContentView.swift
//  FoodPicker
//
//  Created by Changjun Li on 2023/2/6.
//

import SwiftUI

struct FoodPickerScreen: View {
    @State private var selectedFood: Food?
    @State private var shouldShowInfo: Bool = false
    
    let food = Food.examples
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(spacing: 30) {
                    foodImage
                    
                    Text("今天吃什么？").bold()
                    
                    selectedFoodInfoView
                    
                    Spacer().layoutPriority(1)//默认都为0
                    
                    selectFoodButton
                    
                    cancelButton
                }
            }
            .padding()
            .maxWidth()
            .frame(minHeight: proxy.size.height)
            .background(.bg2)
            .font(.largeTitle)
            .mainButtonStyle()
            .animation(.myEase, value: selectedFood)
            .animation(.mySpring, value: shouldShowInfo)
        }
    }
}

//MARK: - SubView
private extension FoodPickerScreen {
    var foodImage: some View {
        Group {
            if let selectedFood {
                Text(selectedFood.image)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.1)
                    .lineLimit(1)
            } else {
                Image("dinner")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
        }
        .frame(height: 250)
    }
    
    var foodNameView: some View {
        HStack {
            Text(selectedFood!.name)
                .bold()
                .foregroundColor(.green)
                .id(selectedFood!.name)
                .transition(.delayInsertionOpacity)
            Button {
                shouldShowInfo.toggle()
            } label: {
                SFSymbol.info
                    .foregroundColor(.secondary)
            }
            .buttonStyle(.plain)
        }
    }
    
    var foodDetailView: some View {
        VStack {
            if shouldShowInfo {
                Grid(verticalSpacing: 12) {
                    GridRow {
                        Text("蛋白质")
                        Text("脂肪")
                        Text("碳水")
                    }
                    .frame(minWidth: 60)
                    
                    Divider()
                        .gridCellUnsizedAxes(.horizontal)
                        .padding(.horizontal, -10)
                    
                    GridRow {
                        Text(selectedFood!.$protein.description)
                        Text(selectedFood!.$fat.description)
                        Text(selectedFood!.$carb.description)
                    }
                }
                .padding(.horizontal)
                .padding()
                .font(.title3)
                .roundRectBackground()
                .transition(.moveUpWithOpacity)
            }
        }
        .maxWidth()//只限制高度滑入
        .clipped()
    }
    
    @ViewBuilder var selectedFoodInfoView: some View {
        if let selectedFood {
            foodNameView
            Text("热量\(selectedFood.$calorie.description)").font(.title2)
            foodDetailView
        }
    }
    
    var selectFoodButton: some View {
        Button(role: .none) {
            
            withAnimation {
                selectedFood = food.shuffled().first
            }
            
        }  label: {
            Text(selectedFood == .none ? "告诉我!" : "换一个").frame(width: 200)
                .transformEffect(.identity)
        }
        .padding(.bottom, -15)
    }
    
    var cancelButton: some View {
        Button {
            withAnimation {
                selectedFood = nil
                shouldShowInfo = false
            }
            
        }  label: {
            Text("重置").frame(width: 200)
        }
        .buttonStyle(.bordered)
    }
}

extension FoodPickerScreen {
    init(selectedFood: Food) {
        _selectedFood = State(wrappedValue: selectedFood)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FoodPickerScreen(selectedFood: .examples.first!)
    }
}
