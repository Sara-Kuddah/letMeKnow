//
// Created for UICalendarView_SwiftUI
// by Stewart Lynch on 2022-06-29
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

struct ListViewRow: View {
    let event: Event
    @Binding var formType: EventFormType?
    @State var navigated = false
    
    @StateObject var myEvents = EventStore(preview: true)
    
    @State var editIsShow = false
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(event.eventType.icon)
                        .font(.system(size: 40))
                    Text(event.note)
                }
                Text(
                    event.date.formatted(date: .abbreviated,
                                         time: .shortened)
                )
            }
            Spacer()
            Button {
                // if 1- edet , more info
            action: do { self.navigated.toggle() }
                if editIsShow {
                    formType = .update(event)
                }else{
                   // RiyadhSeason()
                    NavigationLink("AddCreditCardView", destination: RiyadhSeason(), isActive: $navigated)
//                    RiyadhSeason()
//                        .environmentObject(myEvents)
                    
                    print("norah page")
                    
                    
                }
                
            } label: {
                
                Text(editIsShow ? "Edit" : "more Infooo")
                
                //Text("edit")
            }
            .buttonStyle(.bordered)
        }.onAppear{
            ShowEditBtn ()
        }
    }
    
    func ShowEditBtn ()
    {
        if event.eventType == .user
        {  editIsShow = true
        }
            else
        {
                editIsShow = false
            }
            
    }
    
    
}

 struct ListViewRow_Previews: PreviewProvider {
     static let event = Event(eventType: .user, date: Date(), note: "Let's party")
    static var previews: some View {
        ListViewRow(event: event, formType: .constant(.new))
    }
 }
