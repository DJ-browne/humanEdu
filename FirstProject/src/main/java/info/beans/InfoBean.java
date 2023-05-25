package info.beans;

// 데이터를 담기위한 클래스(*그릇,VO, Value Object, Bean)
// 변수 : 변수명은 name속성의 값과 동일하게하면 편하게 코딩
// 생성자 , getter & setter 필요
public class InfoBean {
	private String name;
	private String id;
	
	public InfoBean() {
		
	}
	
	public InfoBean(String name, String id) {
		super();
		this.name = name;
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	
	
	
}
