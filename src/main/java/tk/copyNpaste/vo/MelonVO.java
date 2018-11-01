/*
* @ Class : MelonVO
* @ Date : 2018.10.30
* @ Author : 임지현
* @ Desc : 메인 크롤링용 VO
*/
package tk.copyNpaste.vo;

public class MelonVO {
	private String rank;
	private String song;
	private String artist;
	private String imgT;
	private String textIntro; 
	private String songNo;
	

	public String getSongNo() {
		return songNo;
	}
	public void setSongNo(String songNo) {
		this.songNo = songNo;
	}
	public String getTextIntro() {
		return textIntro;
	}
	public void setTextIntro(String textIntro) {
		this.textIntro = textIntro;
	}
	public String getImgT() {
		return imgT;
	}
	public void setImgT(String imgT) {
		this.imgT = imgT;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String string) {
		this.rank = string;
	}
	public String getSong() {
		return song;
	}
	public void setSong(String song) {
		this.song = song;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
}
