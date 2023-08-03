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
      url: '/products/' + characterId, // Assuming the path is correct
      method: 'GET',
      dataType: 'script', // Use 'script' to execute the JS response
      success: function() {
        // AJAX success function, no need to do anything here
      },
      error: function(error) {
        console.log(error);
      }
    });
  }
});
