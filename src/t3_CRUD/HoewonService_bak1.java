package t3_CRUD;

import java.util.ArrayList;
import java.util.Scanner;

public class HoewonService_bak1 {
	Scanner sc = new Scanner(System.in);

	// 전체조회
	public void getList() {
		//HoewonDAO dao = new HoewonDAO();
		HoewonDAO2 dao = new HoewonDAO2();
		
		ArrayList<HoewonVO> vos = dao.getList();
		HoewonVO vo = new HoewonVO();
		
		System.out.println("==============================================");
		System.out.println("번호\t성명\t나이\t성별\t주소");
		System.out.println("==============================================");
		for(int i=0; i<vos.size(); i++) {
			vo = vos.get(i);
			System.out.print(vo.getIdx() + "\t");
			System.out.print(vo.getName() + "\t");
			System.out.print(vo.getAge() + "\t");
			System.out.print(vo.getGender() + "\t");
			System.out.print(vo.getAddress() + "\n");
		}
		System.out.println("==============================================");
		System.out.println("\t\t총 : "+vos.size()+" 건");
		
		dao.connClose();
	}

	// 개별 검색처리
	public void getSearch(String name) {
		HoewonDAO2 dao = new HoewonDAO2();
		
		HoewonVO vo = dao.getSearch(name);
		
		System.out.println(name + " 으(로) 검색된 자료?");
		if(vo.getName() != null) {
			System.out.println("번호 : " + vo.getIdx());
			System.out.println("성명 : " + vo.getName());
			System.out.println("나이 : " + vo.getAge());
			System.out.println("성별 : " + vo.getGender());
			System.out.println("주소 : " + vo.getAddress());
		}
		else {
			System.out.println("검색한 자료가 없습니다.");
		}
		
		dao.connClose();
	}

	// 회원 정보 수정
	public void setUpdate(String name) {
		HoewonDAO2 dao = new HoewonDAO2();
		
		HoewonVO vo = dao.getSearch(name);
		
		System.out.println(name + " 으(로) 검색된 자료?");
		if(vo.getName() != null) {
			System.out.println("번호 : " + vo.getIdx());
			System.out.println("성명 : " + vo.getName());
			System.out.println("나이 : " + vo.getAge());
			System.out.println("성별 : " + vo.getGender());
			System.out.println("주소 : " + vo.getAddress());
			System.out.println("---------------------------------");
			System.out.print("수정할 항목? 1.성명  2.나이  3.성별  4.주소 ==> ");
			int choice = sc.nextInt();
			String sel = "";
			switch(choice) {
				case 1:
					System.out.print("수정할 성명을 입력하세요? ");
					sel = sc.next();
					//dao.setUpdateName(sel);		// update hoewon set name = 'name' where idx = 'idx';
					break;
				case 2:
					System.out.print("수정할 나이를 입력하세요? ");
					sel = sc.next();
					//dao.setUpdateAge(Integer.parseInt(sel));		// update hoewon set age = 'age' where idx = 'idx';
					break;
				case 3:
					System.out.print("수정할 성별을 입력하세요? ");
					sel = sc.next();
					//dao.setUpdateGender(sel);		// update hoewon set gender = 'gender' where idx = 'idx';
					break;
			}
			System.out.println("수정완료!");
		}
		else {
			System.out.println("검색한 자료가 없습니다.");
		}
		
		dao.connClose();
	}

}
