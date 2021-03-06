package com.project.Link.Commons.Comment;

import java.sql.Timestamp;

public class Comment {
	private int serial;
	private String usrId;
	private int communitySerial;
	private String contents;
	private Timestamp createDate;
	private Timestamp modifyDate;
	private Timestamp deleteDate;
	private boolean checkSecret;
	private boolean checkBanned;
	private String usrBannedId;
	
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public String getUsrId() {
		return usrId;
	}
	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}
	public int getCommunitySerial() {
		return communitySerial;
	}
	public void setCommunitySerial(int communitySerial) {
		this.communitySerial = communitySerial;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public Timestamp getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Timestamp modifyDate) {
		this.modifyDate = modifyDate;
	}
	public Timestamp getDeleteDate() {
		return deleteDate;
	}
	public void setDeleteDate(Timestamp deleteDate) {
		this.deleteDate = deleteDate;
	}
	public boolean getCheckSecret() {
		return checkSecret;
	}
	public void setCheckSecret(boolean isSecret) {
		this.checkSecret = isSecret;
	}
	public boolean getCheckBanned() {
		return checkBanned;
	}
	public void setCheckBanned(boolean isBanned) {
		this.checkBanned = isBanned;
	}
	public String getUsrBannedId() {
		return usrBannedId;
	}
	public void setUsrBannedId(String usrBannedId) {
		this.usrBannedId = usrBannedId;
	}

	
}
