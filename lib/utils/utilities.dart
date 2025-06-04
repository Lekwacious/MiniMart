import 'dart:math';

 class Utilities{
   static String formatCurrency(String amount) {
     double parsedAmount = double.tryParse(amount) ?? 0.0;
     return '₦${parsedAmount.toStringAsFixed(2).replaceAllMapped(
         RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
             (Match m) => '${m[1]},')}';
   }

 }