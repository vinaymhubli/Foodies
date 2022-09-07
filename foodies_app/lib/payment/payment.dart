import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:toast/toast.dart';

class PaymentGateway extends StatefulWidget {
  PaymentGateway({Key? key}) : super(key: key);

  @override
  State<PaymentGateway> createState() => _PaymentGatewayState();
}

class _PaymentGatewayState extends State<PaymentGateway> {
  late Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    razorpay = new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentsucess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlererror);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerwallet);
  }

  void handlerPaymentsucess() {
    print("Hey Payment Sucess");
    // Toast.show("Hey Payment Sucess", context);
  }

  void handlererror() {
    print("Please Check Your Credential");
    // Toast.show("Please Check Your Credential", context);
  }

  void handlerwallet() {
    print("External wallet");
    // Toast.show("External wallet", context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_DdwfiSH8rPyBXN",
      "amount": num.parse(textEditingController.text) * 100,
      "name": "Ordered items",
      "discription": "Payment for cource",
      "prefill": {"contact": "8317408836", "email": "vinaym1815@gmail.com"},
      "external": {
        "wallets": ["paytm"]
      }
    };
   
    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset('assets/images/payment.json',width: 200),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: "Amount to be pay",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green.shade700),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)
              ),
              child: Text(
                "Pay Now",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                openCheckout();
              },
              color: Color.fromARGB(255, 214, 18, 67),
            ),

          ],
        ),
      ),
    );
  }
}
