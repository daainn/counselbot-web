$(document).ready(function () {
  $('.open-modal').click(function (e) {
    e.preventDefault();
    const url = $(this).data('url');

    $.get(url, function (data) {
      $('#modalContent').html(data);
      $('#dynamicModal').fadeIn();
    });
  });

  $(document).on('click', '.modal-close', function () {
    $('#dynamicModal').fadeOut();
    $('#modalContent').html('');
  });

  $(document).mouseup(function (e) {
    const modal = $(".modal");
    if (!modal.is(e.target) && modal.has(e.target).length === 0) {
      $('#dynamicModal').fadeOut();
      $('#modalContent').html('');
    }
  });
});
