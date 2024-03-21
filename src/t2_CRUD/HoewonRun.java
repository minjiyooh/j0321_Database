package t2_CRUD;

public class HoewonRun {
	public static void main(String[] args) {
		// HoewonDAO2 dao = new HoewonDAO2();
		// HoewonDAO dao = new HoewonDAO();
		HoewonDAO3 dao = new HoewonDAO3();
		// hoewon 자료 전체조회

		dao.getList();

		dao.connClose();

	}
}
