import 'package:animations/animations.dart';
import 'package:credit_card_form/credit_card_form.dart';
import 'package:e_learning_app/main.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  //MARK: Visa: 0, Master: 1
  int isSelectedCard = 0;
  int checkoutStep = 0;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff009FC1),
        title: const Text('Checkout', style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: (){
            if(checkoutStep==0){Navigator.pop(context);}
            else if(checkoutStep == 1){
              checkoutStep = 0;
            }else {
              checkoutStep = 1;
            }

            setState(() {
              
            });
            
          },
        ),
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        // reverse: checkoutStep < 1, // Reverse the animation when navigating back
        // transitionBuilder: (child, animation, secondaryAnimation) {
        //   return SlideTransition(
        //     position: Tween<Offset>(
        //       begin: Offset(1.0, 0.0), // New widget slides in from the right
        //       end: Offset(0.0, 0.0), // New widget ends in the center
        //     ).animate(animation),
        //     child: SlideTransition(
        //       position: Tween<Offset>(
        //         begin: Offset(0.0, 0.0), // Old widget starts in the center
        //         end: Offset(-1.0, 0.0), // Old widget slides out to the left
        //       ).animate(secondaryAnimation),
        //       child: child,
        //     ),
        //   );
        // },
        child: _getCheckoutStep(), // Display the current step
      )
    );
  }

  // Function to return the current step widget with unique Key
  Widget _getCheckoutStep() {
    switch (checkoutStep) {
      case 0:
        return Container(key: ValueKey(0), child: checkoutStep1());
      case 1:
        return Container(key: ValueKey(1), child: checkoutStep2());
      case 2:
        return Container(key: ValueKey(2), child: checkoutStep3());
      default:
        return Container(key: ValueKey(0), child: checkoutStep1());
    }
  }

  checkoutStep1() {
    return SingleChildScrollView(
        child: Column(
          children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 27, top: 20),
              child: Image.asset("asset/images/checkout_step1.png", width: MediaQuery.of(context).size.width * 0.7),
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text("Overview", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                Row(
                  children: [
                    Text("Name of Lession:  "), Text("Python Programming", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff086C54).withOpacity(0.1)
                  ),
                  child:
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.34,
                            child: Text("Review: ",),
                          ),
                          Row(
                            children: [
                              Text("4.0", style: TextStyle(fontWeight: FontWeight.w500)),
                              SizedBox(width: 5,),
                              Row(
                                children: const [
                                  Icon(Icons.star, color: Color(0xffFFBC10), size: 14,),
                                  Icon(Icons.star, color: Color(0xffFFBC10), size: 14,),
                                  Icon(Icons.star, color: Color(0xffFFBC10), size: 14,),
                                  Icon(Icons.star, color: Color(0xffFFBC10), size: 14,),
                                  Icon(Icons.star_border, color: Colors.grey, size: 14,),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.34,
                          child: Text("Course Time: ")),
                        Text("7 Hrs", style: TextStyle(fontWeight: FontWeight.w500))
                      ],),
                      Row(children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.34,
                          child: Text("Name of Trainer: ")),
                        Text("Miss. Angela You", style: TextStyle(fontWeight: FontWeight.w500),)
                      ],),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Text("Payment method", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                SizedBox(height: 10,),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSelectedCard = 0;
                        });
                      },
                      child: Container(
                        width: 88,height: 60,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: isSelectedCard == 0 ?2:1,color:isSelectedCard == 0 ? Colors.green : Colors.grey,),
                        
                      ),
                        child: Image.asset("asset/images/visa.png"),
                      ),
                    ),SizedBox(width: 15,),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSelectedCard = 1;
                        });
                      },
                      child: Container(
                        // color: Colors.transparent,
                        width: 88,height: 60,
                        decoration: BoxDecoration(
                          
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: isSelectedCard == 1?2:1, color: isSelectedCard == 1 ? Colors.green : Colors.grey,),
                        color: Colors.transparent
                      ),
                        child: Image.asset("asset/images/master.png"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Text("Fill your card info", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                SizedBox(height: 10,),
                CreditCardForm(
                  theme: CreditCardLightTheme()
                          ..backgroundColor = Colors.transparent,
                  onChanged: (CreditCardResult result) {
                      print(result.cardNumber);
                      print(result.cardHolderName);
                      print(result.expirationMonth);
                      print(result.expirationYear);
                      print(result.cardType);
                      print(result.cvc);
              }),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(top: 10),
                child: Text("Final Price: 24.22\$", textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.w700),),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
            
                onPressed: () {
                  setState(() {
                    checkoutStep = 1;
                  });
                  // Handle button press
                  // if(_isLogin){
                  //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckoutPage()));
                  // }else {
                  //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => WelcomePage()));
                  // }
                },
                child:
                Container(
                  alignment: Alignment.center,
                  height: 15,
                  width: MediaQuery.of(context).size.width*0.8 , child: Text('Continue To Checkout', style: TextStyle(color: Colors.white),),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff009FC1), // Set the button's background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Set the button's border radius
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16), // Set the button's padding
                  ),
              ),
              SizedBox(height: 20,)

            ]
            )
          ),
        ],),
      );
  }
  ///
  ///
  checkoutStep2() {
    return SingleChildScrollView(
        child: Column(
          children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 27, top: 20),
              child: Image.asset("asset/images/checkout_step2.png", width: MediaQuery.of(context).size.width * 0.7),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.78,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text("Purchase Info", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                
                Text("Python Programming", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  height: 160,
                  child: Image.asset('asset/images/pythonCourse.png', fit: BoxFit.fill,),
                ),
               
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff086C54).withOpacity(0.1)
                  ),
                  child:
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.34,
                            child: Text("Review: ",),
                          ),
                          Row(
                            children: [
                              Text("4.0", style: TextStyle(fontWeight: FontWeight.w500)),
                              SizedBox(width: 5,),
                              Row(
                                children: const [
                                  Icon(Icons.star, color: Color(0xffFFBC10), size: 14,),
                                  Icon(Icons.star, color: Color(0xffFFBC10), size: 14,),
                                  Icon(Icons.star, color: Color(0xffFFBC10), size: 14,),
                                  Icon(Icons.star, color: Color(0xffFFBC10), size: 14,),
                                  Icon(Icons.star_border, color: Colors.grey, size: 14,),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.34,
                          child: Text("Course Time: ")),
                        Text("7 Hrs", style: TextStyle(fontWeight: FontWeight.w500))
                      ],),
                      Row(children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.34,
                          child: Text("Name of Trainer: ")),
                        Text("Miss. Angela You", style: TextStyle(fontWeight: FontWeight.w500),)
                      ],),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff086C54).withOpacity(0.1)
                  ),
                  child:
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.34,
                            child: Text("Card Holder: ",),
                          ),
                          Text("Long Seumeng", style: TextStyle(fontWeight: FontWeight.w500))
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.34,
                          child: Text("Card Number: ")),
                        Text("0000039499494", style: TextStyle(fontWeight: FontWeight.w500))
                      ],),
                     
                    ],
                  ),
                ),
                
              Spacer(),
              ElevatedButton(
            
                onPressed: () {
                  // Handle button press
                  setState(() {
                    checkoutStep = 2;
                  });
                },
                child:
                Container(
                  alignment: Alignment.center,
                  height: 15,
                  width: MediaQuery.of(context).size.width*0.8 , child: Text('Continue To Checkout', style: TextStyle(color: Colors.white),),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff009FC1), // Set the button's background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Set the button's border radius
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16), // Set the button's padding
                  ),
              ),
              SizedBox(height: 20,)

            ]
            )
          ),
        ],),
      );
  }
  checkoutStep3() {
    return SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - AppBar().preferredSize.height-50,
          child: Column(
            children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 27, top: 20),
                child: Image.asset("asset/images/checkout_step3.png", width: MediaQuery.of(context).size.width * 0.7),
              ),
            ),
          
            Container(
              padding: EdgeInsets.only(top: 50),
              width: MediaQuery.of(context).size.width * 0.7,
              child: Image.asset('asset/images/processedPay.png'),
            ),

            Spacer(),
            Text("Your Payment was successfully!"),

            Spacer(),

            ElevatedButton(
              
            
                onPressed: () {
                  // Handle button press
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainPage()));
                },
                child:
                Container(
                  alignment: Alignment.center,
                  height: 20,
                  width: MediaQuery.of(context).size.width*0.8 , child: Text('Finish', style: TextStyle(color: Colors.white),),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff009FC1), // Set the button's background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Set the button's border radius
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16), // Set the button's padding
                  ),
              ),
            
          ],),
        ),
      );
  }
}