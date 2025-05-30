$(document).ready(function () {
  // 모달 열기
  $('.open-modal').click(function (e) {
    e.preventDefault();
    const url = $(this).data('url');

    $.get(url, function (data) {
      $('#modalContent').html(data);
      $('#dynamicModal').fadeIn();
    });
  });

  // 닫기, 취소 버튼 -> 모달 닫기

  $(document).on('click', '.modal-close', function () {
    $('#dynamicModal').fadeOut();
    $('#modalContent').html('');
  });

  $(document).on('click', '#modalCancelBtn', function () {
  $('#dynamicModal').fadeOut();
  $('#modalContent').html('');
});

 
});
