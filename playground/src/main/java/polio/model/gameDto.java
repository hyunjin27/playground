package polio.model;

public class gameDto {
	int num;
	
	String gamename;

	String gamegene;

	String gamenick;

	String gamedetail;

	private int ref;//글 그룹
	
	private int re_step;//원글, 답글 순서
	
	private int re_level;//답글 깊이
	

	
	public String getGamename() {
		return gamename;
	}

	public void setGamename(String gamename) {
		this.gamename = gamename;
	}

	public String getGamegene() {
		return gamegene;
	}

	public void setGamegene(String gamegene) {
		this.gamegene = gamegene;
	}

	public String getGamenick() {
		return gamenick;
	}

	public void setGamenick(String gamenick) {
		this.gamenick = gamenick;
	}

	public String getGamedetail() {
		return gamedetail;
	}

	public void setGamedetail(String gamedetail) {
		this.gamedetail = gamedetail;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRe_step() {
		return re_step;
	}

	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}

	public int getRe_level() {
		return re_level;
	}

	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}


	
	
}
