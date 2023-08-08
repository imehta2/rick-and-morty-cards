// app/assets/javascripts/characters.js
$(document).on('turbolinks:load', function() {
  // Handle click event on the "view" link
  $('.card-link').on('click', function(event) {
    event.preventDefault();
    var characterId = $(this).data('character-id');
    fetchCharacterDetails(characterId);
  });

  // Function to fetch character details using AJAX
  function fetchCharacterDetails(characterId) {
    $.ajax({
      url: '/products/' + characterId,
      method: 'GET',
      dataType: 'html',
      success: function(response) {
        // Update the modal with the fetched character details
        $('#character-details-modal').html(response);

        // Show the modal
        $('#character-details-modal').fadeIn();
      },
      error: function(error) {
        console.log(error);
      }
    });
  }
});
