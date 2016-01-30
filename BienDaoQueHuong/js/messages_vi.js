/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: VI (Vietnamese; Tiếng Việt)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "<br />* Hãy nhập.",
		remote: "<br />* Đã tồn tại, hãy chọn cái khác.",
		email: "<br />* Hãy nhập email.",
		url: "<br />* Hãy nhập URL.",
		date: "<br />* Hãy nhập ngày.",
		dateISO: "<br />* Hãy nhập ngày (ISO).",
		number: "<br />* Hãy nhập số.",
		digits: "<br />* Hãy nhập chữ số.",
		creditcard: "<br />* Hãy nhập số thẻ tín dụng.",
		equalTo: "<br />* Hãy nhập thêm lần nữa.",
		accept: "<br />* Phần mở rộng không đúng.",
		maxlength: $.format("<br />* Hãy nhập từ {0} kí tự trở xuống."),
		minlength: $.format("<br />* Hãy nhập từ {0} kí tự trở lên."),
		rangelength: $.format("<br />* Hãy nhập từ {0} đến {1} kí tự."),
		range: $.format("<br />* Hãy nhập từ {0} đến {1}."),
		max: $.format("<br />* Hãy nhập từ {0} trở xuống."),
		min: $.format("<br />* Hãy nhập từ {1} trở lên.")
	});
}(jQuery));