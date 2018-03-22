    function check(input) {
        if (input.value != document.getElementById('pwd').value) {
            input.setCustomValidity('암호가 다릅니다.');
        } else {
            // input is valid -- reset the error message
            input.setCustomValidity('');
        }
    }
    
    $(document).ready(function(){
        $('#userid').keyup(function(){
        	//console.log($('#userid').val());
            if ( $('#userid').val().length > 3) {
                var userid = $('#userid').val();
                // ajax 실행
                $.ajax({
                    type : 'POST',
                    url : '/boblog_member/id_check.bob',
                    data:
                    {
                        userid: userid
                    },
                    success : function(result) {
                        //console.log(result);
                        if (result == 1) {
                            $("#result_id_msg").html("사용 가능한 아이디 입니다.");
                        } else {
                            $("#result_id_msg").html("사용 불가능한 아이디 입니다.");
                        }
                    }
                }); // end ajax
            }
        }); // end keyup
    });