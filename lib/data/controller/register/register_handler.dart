
import '../../../presentation/common/dialog_widget.dart';

class RegisterHandler {


  static void handleError (context, String serverResponse) {
    print("Reeeeeess: Couldn't Register $serverResponse");
    DialogWidget(
        context,
        isTextEditingDialog: false,
        dialogTitle: "Incorrect Data",
        dialogBody: serverResponse,
        firstButtonTitle: 'Ok').showAlert();
  }

}