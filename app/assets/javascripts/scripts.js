//Client-side friend_phone_number validation
$('#number').regexMask(/^\d+$/);


// THIS ONE MIGHT WORK...

// function validateForm() {
//   var formValid = false;
//   var radio1 = $($('input[type=radio]')[0]);
//   var radio2 = $($('input[type=radio]')[1]);
//   var radio3 = $($('input[type=radio]')[2]);
//   var radio4 = $($('input[type=radio]')[3]);
//   var radio5 = $($('input[type=radio]')[4]);
//   var radio6 = $($('input[type=radio]')[5]);
//   var radio7 = $($('input[type=radio]')[6]);

//   $('#survey-submit-button').click(function() {
//     if (radio1.is(':checked') || radio2.is(':checked') || radio3.is(':checked')) && (radio4.is(':checked') || radio5.is(':checked')) && (radio6.is(':checked') || radio7.is(':checked')) {
//       return !formValid;
//     };
//   });

// THIS ONE PROBABLY DOESN'T WORK YET...

//   var radios = document.getElementsByName("radios");
//   var formValid = false;

//   var i = 0;
//   while (!formValid && i < radios.length) {
//     if (radios[i].checked){ 
//       formValid = radios[i].value; 
//       i++
//     }
//   }
//   if (!formValid) alert("Must answer all questions!");
//   return formValid;
// }