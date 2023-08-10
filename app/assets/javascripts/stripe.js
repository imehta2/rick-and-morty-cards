document.addEventListener("DOMContentLoaded", function () {
  var stripe = Stripe("<%= Rails.configuration.stripe[:publishable_key] %>");
  var elements = stripe.elements();

  var card = elements.create("card");
  card.mount("#card-element");

  var cardErrors = document.getElementById("card-errors");

  card.on("change", function (event) {
    if (event.error) {
      cardErrors.textContent = event.error.message;
    } else {
      cardErrors.textContent = "";
    }
  });

  var form = document.getElementById("payment-form");
  form.addEventListener("submit", function (event) {
    event.preventDefault();

    stripe.createToken(card).then(function (result) {
      if (result.error) {
        cardErrors.textContent = result.error.message;
      } else {
        var token = result.token.id;

        $.post("/checkout/process_payment", { token: token }, function(data) {


        });
      }
    });
  });
});
