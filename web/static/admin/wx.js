$("#setBox").click(function () {
    if ($(this).prop("checked")) {
        $("input[name=id]").prop("checked", true)
    } else {
        $("input[name=id]").prop("checked", false)
    }
});
setCookie('order', 'id desc');

