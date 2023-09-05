import SwiftUI

struct ExperimentalView: View {
    @State var testNetEnabled = false

    var body: some View {
        ZStack {
            Color.themeTyler.edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: .margin32) {
//                    HighlightedDescriptionView(text: "The features below are experimental and should be used with caution. While we have thoroughly tested these features using our own crypto funds, we cannot guarantee they will work as expected in all possible cases.")
//                    HighlightedDescriptionView(text: "The features below are experimental", style: .alert)

                    ListSection(footerText: "Together, with your support, we can make this app even better!") {
                        ClickableRow(action: {
                            print("Did Tap Donate")
                        }) {
                            Image("heart_fill_24").themeIcon(color: .themeJacob)
                            Text("Donate").themeBody()
                            Image.disclosureIcon
                        }
                    }

                    ListSection {
                        ClickableRow(action: {
                            print("Did Tap Manage Wallets")
                        }) {
                            Image("wallet_24").themeIcon()
                            Text("Manage Wallets").themeBody()
                            Image.disclosureIcon
                        }

                        ClickableRow(action: {
                            print("Did Tap Blockchain Settings")
                        }) {
                            Image("wallet_24").themeIcon()
                            Text("Blockchain Settings").themeBody()
                            Image.disclosureIcon
                        }
                    }

                    ListSection {
                        ClickableRow(action: {
                            print("Did Tap WalletConnect")
                        }, content: {
                            Image("wallet_24").themeIcon()
                            Text("WalletConnect").themeBody()
                            Image.disclosureIcon
                        })
                    }

                    ListSection {
                        ClickableRow(action: {
                            print("Did Tap Security")
                        }, content: {
                            Image("wallet_24").themeIcon()
                            Text("Security").themeBody()
                            Image("warning_2_20").themeIcon(color: .themeLucian).padding(.trailing, -.margin8) // todo: find another way to decrease default spacing
                            Image.disclosureIcon
                        })

                        ClickableRow(action: {
                            print("Did Tap Contacts")
                        }, content: {
                            Image("wallet_24").themeIcon()
                            Text("Contacts").themeBody()
                            Image.disclosureIcon
                        })

                        ClickableRow(action: {
                            print("Did Tap Appearance")
                        }, content: {
                            Image("wallet_24").themeIcon()
                            Text("Appearance").themeBody()
                            Image.disclosureIcon
                        })

                        ClickableRow(action: {
                            print("Did Tap Base Currency")
                        }, content: {
                            Image("wallet_24").themeIcon()
                            Text("Base Currency").themeBody()
                            Text("USD").themeSubhead1(alignment: .trailing).padding(.trailing, -.margin8) // todo: find another way to decrease default spacing
                            Image.disclosureIcon
                        })

                        ClickableRow(action: {
                            print("Did Tap Language")
                            testNetEnabled = !testNetEnabled
                        }, content: {
                            Image("wallet_24").themeIcon()
                            Text("Language").themeBody()
                            Text("English").themeSubhead1(alignment: .trailing).padding(.trailing, -.margin8) // todo: find another way to decrease default spacing
                            Image.disclosureIcon
                        })
                    }

                    BrandFooter(name: "Unstoppable", version: "0.35", build: "25", description: "decentralized app")

                    ListSection {
                        Row {
                            Toggle(isOn: $testNetEnabled) {
                                Text("TestNet Enabled").themeBody()
                            }
                        }
                    }
                }
                        .padding(EdgeInsets(top: .margin12, leading: .margin16, bottom: .margin32, trailing: .margin16))
            }
        }
    }

}

struct BrandFooter: View {
    let name: String
    let version: String
    let build: String
    let description: String

    var body: some View {
        VStack(spacing: .margin8) {
            Text("\(name) \(version) (\(build))")
                .font(.caption)
                .foregroundColor(.themeGray)
            Divider()
                .foregroundColor(.themeSteel20)
            Text(description)
                .font(.themeMicro)
                .foregroundColor(.themeGray)
            Image("HS Logo Image")
                .padding(.top, .margin32)
        }.fixedSize()
    }

}

extension Text {

    func themeBody(color: Color = .themeLeah, alignment: Alignment = .leading) -> some View {
        self
                .frame(maxWidth: .infinity, alignment: alignment)
                .foregroundColor(color)
                .font(.themeBody)
    }

    func themeSubhead1(color: Color = .themeGray, alignment: Alignment = .leading) -> some View {
        self
                .frame(maxWidth: .infinity, alignment: alignment)
                .foregroundColor(color)
                .font(.themeSubhead1)
    }

    func themeSubhead2(color: Color = .themeGray, alignment: Alignment = .leading) -> some View {
        self
                .frame(maxWidth: .infinity, alignment: alignment)
                .foregroundColor(color)
                .font(.themeSubhead2)
    }

}

extension Image {

    func themeIcon(color: Color = .themeGray) -> some View {
        renderingMode(.template)
                .foregroundColor(color)
    }

    static var disclosureIcon: some View {
        Image("arrow_big_forward_20").themeIcon()
    }

}

struct CellButton: ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
                .background(configuration.isPressed ? Color.themeLawrencePressed : Color.themeLawrence)
    }

}

struct ListSection<Content: View>: View {
    var content: Content
    var footerText: String?

    init(footerText: String? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.content = content()
        self.footerText = footerText
    }

    var body: some View {
        VStack(spacing: 0) {
            _VariadicView.Tree(Layout()) {
                        content
                    }
                    .background(RoundedRectangle(cornerRadius: .cornerRadius12, style: .continuous).fill(Color.themeLawrence))
                    .clipShape(RoundedRectangle(cornerRadius: .cornerRadius12, style: .continuous))

            if let footerText {
                Text(footerText)
                        .themeSubhead2()
                        .padding(EdgeInsets(top: .margin12, leading: .margin16, bottom: 0, trailing: .margin16))
            }
        }
    }

    struct Layout: _VariadicView_UnaryViewRoot {
        @ViewBuilder
        func body(children: _VariadicView.Children) -> some View {
            let last = children.last?.id

            VStack(spacing: 0) {
                ForEach(children) { child in
                    child

                    if child.id != last {
                        HorizontalDivider()
                    }
                }
            }
        }
    }

}

struct ClickableRow<Content: View>: View {
    let action: () -> Void
    @ViewBuilder let content: Content

    var body: some View {
        Button(action: action, label: {
            Row {
                content
            }
        })
                .buttonStyle(CellButton())
                .contentShape(Rectangle())
    }
}

struct Row<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        HStack(spacing: .margin16) {
            content
        }
                .padding(EdgeInsets(top: .margin12, leading: .margin16, bottom: .margin12, trailing: .margin16))
    }
}

struct HorizontalDivider: View {
    private let color: Color
    private let height: CGFloat

    init(color: Color = .themeSteel10, height: CGFloat = 1) {
        self.color = color
        self.height = height
    }

    var body: some View {
        color.frame(height: height)
    }

}

struct HighlightedDescriptionView: View {
    private let text: String
    private let style: Style

    init(text: String, style: Style = .warning) {
        self.text = text
        self.style = style
    }

    var body: some View {
        Text(text)
                .padding(EdgeInsets(top: .margin12, leading: .margin16, bottom: .margin12, trailing: .margin16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.themeBran)
                .font(.themeSubhead2)
                .background(RoundedRectangle(cornerRadius: .cornerRadius12, style: .continuous).fill(style.color.opacity(0.2)))
                .overlay(
                        RoundedRectangle(cornerRadius: .cornerRadius12, style: .continuous).stroke(style.color, lineWidth: .heightOneDp)
                )
    }

    enum Style {
        case warning
        case alert

        var color: Color {
            switch self {
            case .warning: return .themeYellow
            case .alert: return .themeLucian
            }
        }
    }

}

struct ExperimentalView_Preview: PreviewProvider {
    static var previews: some View {
        ExperimentalView()
    }
}
