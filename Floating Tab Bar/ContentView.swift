//
//  ContentView.swift
//  Floating Tab Bar
//
//  Created by Aiden Ruiz on 10/19/24.
//
 
import SwiftUI

struct ContentView: View {
    /// View Properties
    @State private var activeTab : TabModel = .home
    @State private var isTabBarHidden : Bool = false
    
    var body: some View {
        if #available(iOS 18, *) {
            TabView(selection: $activeTab) {
                Tab.init(value: .home) {
                    Text("Home")
                        .toolbarVisibility(.hidden, for: .tabBar)
                }
                Tab.init(value: .search) {
                    Text("Search")
                        .toolbarVisibility(.hidden, for: .tabBar)
                }
                Tab.init(value: .notifications) {
                    Text("Notifications")
                        .toolbarVisibility(.hidden, for: .tabBar)
                }
                Tab.init(value: .settings) {
                    Text("Settings")
                        .toolbarVisibility(.hidden, for: .tabBar)
                }

            }
        }else{
            TabView(selection: $activeTab) {
                Text("Home")
                    .tag(TabModel.home)
                    .background {
                        if !isTabBarHidden {
                            HideTabBar{
                                print ("Tab Bar is hidden")
                                isTabBarHidden = true
                            }
                        }
                    }
                
                Text("Search")
                    .tag(TabModel.search)
                
                
                Text("Notifications")
                    .tag(TabModel.notifications)
                
                
                Text("Settings")
                    .tag(TabModel.settings)
                
                
            }
            .overlay {
                Button {
                    activeTab = activeTab == .home ? .settings : .home
                } label: {
                    Text("Switch Tabs")
                }
                .offset(y: 200)
            }
        }
    }
}

struct HideTabBar : UIViewRepresentable{
        
    init (result: @escaping () -> Void) {
        UITabBar.appearance().isHidden = true
        self.result = result
        
    }
    var result: () -> ()
    func makeUIView(context: Context) -> UIView
    {
    let view = UIView (frame: .zero)
    
    view.backgroundColor = .clear
    DispatchQueue.main.async {
        if let tabController = view.tabController {
            UITabBar.appearance() .isHidden =
            false
            tabController.tabBar.isHidden = true
            result()
         }
        }
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context)
    { }
}

extension UIView {
    var tabController: UITabBarController? {
        if let controller = sequence(first: self, next: {
            $0.next
        }).first(where: {$0 is UITabBarController}) as? UITabBarController {
            return controller
        }
        
        return nil
        
    }
}

#Preview {
    ContentView()
}
