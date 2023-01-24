import 'package:shyheads_deliveryboy_app/controllers/orders_controllers/orders_controller.dart';
import 'package:shyheads_deliveryboy_app/models/order_model.dart';
import 'package:shyheads_deliveryboy_app/shared/size_configuration/size_config.dart';
import 'package:shyheads_deliveryboy_app/view/requests_view/components/pending/pending_request_card.dart';
import 'package:shyheads_deliveryboy_app/view/requests_view/components/pending/pending_request_card_with_shimmer.dart';
import 'package:flutter/material.dart';

class PendingRequestBody extends StatefulWidget {
  PendingRequestBody() : super();

  @override
  _PendingRequestBodyState createState() => _PendingRequestBodyState();
}

class _PendingRequestBodyState extends State<PendingRequestBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FutureBuilder<List<OrderModel>>(
            future:
                OrderController.getAllOrdersForDeliveryBoyAndByOrderStatus(1),
            builder: (context, snapshot) {
              if (snapshot.data == null || !snapshot.hasData) {
                return Column(
                    children: List.generate(2, (index) {
                      return Padding(
                          padding: EdgeInsets.only(
                              top: getProportionateScreenHeight(10)),
                          child: PendingRequestCardWithShimmer(),
                        );
                    }),
                  );
              }
              if (snapshot.data.isEmpty) {
                return Text('No Pending');
              }
              return Padding(
                padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
                child: PendingRequestCard(orderModel: snapshot.data[0]),
              );
            }),
      ],
    );
  }
}
