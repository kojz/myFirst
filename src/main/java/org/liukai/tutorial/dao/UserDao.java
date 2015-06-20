package org.liukai.tutorial.dao;

import java.util.ArrayList;
import java.util.List;

import org.liukai.tutorial.domain.DbUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UserDao {

	protected static Logger logger = LoggerFactory.getLogger(UserDao.class);

	public DbUser getDatabase(String username) {

		List<DbUser> users = internalDatabase();

		for (DbUser dbUser : users) {
			if (dbUser.getUsername().equals(username) == true) {
				logger.debug("User found");
				return dbUser;
			}
		}
		logger.error("User does not exist!");
		throw new RuntimeException("User does not exist!");

	}

	/**
	 * 初始化数据
	 */
	private List<DbUser> internalDatabase() {

		List<DbUser> users = new ArrayList<DbUser>();
		DbUser user = null;

		user = new DbUser();
		user.setUsername("admin");

		// "admin"经过MD5加密后
		user.setPassword("e10adc3949ba59abbe56e057f20f883e");
		user.setAccess(1);

		users.add(user);

		user = new DbUser();
		user.setUsername("user");

		// "user"经过MD5加密后
		user.setPassword("e10adc3949ba59abbe56e057f20f883e");
		user.setAccess(2);

		users.add(user);

		return users;

	}
}
