import 'package:whatsapp2app/Models/Dto/Chat/OpenChat.dart';
import 'package:whatsapp2app/Models/Dto/Message/MessageModel.dart';
import 'package:whatsapp2app/Models/Dto/User/UserModel.dart';
import 'package:whatsapp2app/Store/Global/Actions.dart';

class GlobalState {
  List<Message> messages;
  List<OpenChat> openChats;
  User? selectedRecipient;

  GlobalState(this.messages, this.openChats, this.selectedRecipient);

  GlobalState.initialState()
      : messages = List.unmodifiable(<Message>[]),
        openChats = List.unmodifiable(<OpenChat>[]),
        selectedRecipient = null;

  GlobalState.clone(GlobalState currState)
      : this(currState.messages, currState.openChats,
            currState.selectedRecipient);
}

GlobalState globalReducer(GlobalState state, action) {
  var newState = GlobalState.clone(state);

  if (action is SetMessagesAction)
    return newState..messages = action.messages;
  else if (action is SetOpenChatsAction)
    return newState..openChats = action.openChats;
  else if (action is NewMessageAction)
    return newState..messages.add(action.newMessage);

  return state;
}
