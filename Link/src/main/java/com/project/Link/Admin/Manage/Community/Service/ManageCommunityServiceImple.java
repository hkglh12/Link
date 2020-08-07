package com.project.Link.Admin.Manage.Community.Service;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.Link.Admin.Manage.Community.Dao.ManageCommunityDao;
import com.project.Link.RegUser.Comment.Service.CommentService;
import com.project.Link.RegUser.Community.Dao.CommunityDao;
import com.project.Link.RegUser.Community.Service.CommunityServiceImple;
import com.project.Link.RegUser.Noticement.NoticementService.NoticementServiceImple;
import com.project.Link.Ufile.Service.UfileService;

@Service
@Qualifier("AdminCommunityService")
public class ManageCommunityServiceImple extends CommunityServiceImple implements ManageCommunityService{
	@Autowired
	@Qualifier("AdminCommunityDao")
	private ManageCommunityDao mcDao;
	
	@Override
	public boolean banCommunity(int targetSerial, String usrId) {
		Timestamp deleteDate = Timestamp.valueOf(LocalDateTime.now());
		return mcDao.banCommunity(targetSerial,usrId, deleteDate);
	}
	@Override
	public boolean bulkCommunityBan(String[] list, String usrId) {
		boolean result = false;
		Timestamp deleteDate = Timestamp.valueOf(LocalDateTime.now());
		for(int i=0; i<list.length; i++) {
			result = mcDao.bulkBanCommunity(Integer.valueOf(list[i]), usrId, deleteDate);
			if(result == false) {
				break;
			}
		}
		return result;
	}
	@Override
	public boolean banComment(int targetSerial, String usrId) {
		Timestamp deleteDate = Timestamp.valueOf(LocalDateTime.now());
		return mcDao.banComment(targetSerial, usrId, deleteDate);
	}

}
