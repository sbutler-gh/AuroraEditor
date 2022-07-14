//
//  SideBar.swift
//  AuroraEditor
//
//  Created by Lukas Pistrol on 17.03.22.
//

import SwiftUI
import WorkspaceClient

struct NavigatorSidebar: View {
    @ObservedObject
    private var workspace: WorkspaceDocument

    private let windowController: NSWindowController

    @State
    public var selection: Int = 0

    private let toolbarPadding: Double = -8.0

    init(workspace: WorkspaceDocument, windowController: NSWindowController) {
        self.workspace = workspace
        self.windowController = windowController
    }

    var body: some View {
        VStack {
            switch selection {
            case 0:
                ProjectNavigator(workspace: workspace)
            case 1:
                SourceControlNavigatorView(workspace: workspace)
            case 2:
                FindNavigator(state: workspace.searchState ?? .init(workspace))
            case 3:
                VStack(alignment: .center) {
                    Text("Needs Implementation")
                }
                .frame(maxHeight: .infinity)
            case 4:
                VStack(alignment: .center) {
                    Text("Needs Implementation")
                }
                .frame(maxHeight: .infinity)
            case 5:
                VStack(alignment: .center) {
                    Text("Needs Implementation")
                }
                .frame(maxHeight: .infinity)
            case 6:
                VStack(alignment: .center) {
                    Text("Needs Implementation")
                }
                .frame(maxHeight: .infinity)
            case 7:
                ExtensionNavigator(data: workspace.extensionNavigatorData)
                    .environmentObject(workspace)
            default:
                Spacer()
            }
        }
        .safeAreaInset(edge: .top) {
            NavigatorSidebarToolbarTop(selection: $selection)
                .padding(.bottom, toolbarPadding)
        }
        .safeAreaInset(edge: .bottom) {
            switch selection {
            case 0:
                NavigatorSidebarToolbarBottom(workspace: workspace)
                    .padding(.top, toolbarPadding)
            case 1:
                SourceControlToolbarBottom()
                    .padding(.top, toolbarPadding)
            case 2:
                NavigatorSidebarToolbarBottom(workspace: workspace)
                    .padding(.top, toolbarPadding)
            case 3:
                NavigatorSidebarToolbarBottom(workspace: workspace)
                    .padding(.top, toolbarPadding)
            case 4:
                NavigatorSidebarToolbarBottom(workspace: workspace)
                    .padding(.top, toolbarPadding)
            case 5:
                NavigatorSidebarToolbarBottom(workspace: workspace)
                    .padding(.top, toolbarPadding)
            case 6:
                NavigatorSidebarToolbarBottom(workspace: workspace)
                    .padding(.top, toolbarPadding)
            case 7:
                NavigatorSidebarToolbarBottom(workspace: workspace)
                    .padding(.top, toolbarPadding)
            default:
                NavigatorSidebarToolbarBottom(workspace: workspace)
                    .padding(.top, toolbarPadding)
            }
        }
    }
}
