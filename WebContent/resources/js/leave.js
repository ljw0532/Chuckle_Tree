/**
 * 
 */
function leaveId(){
		if(confirm("정말로 탈퇴하시겠습니까?")==true){
			location.href="/cktree/member/myProfile/leaveId";
		} else{
			return false;
		}		
}