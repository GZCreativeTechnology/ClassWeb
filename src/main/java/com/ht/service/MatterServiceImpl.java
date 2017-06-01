package com.ht.service;

import com.ht.bean.Matter;
import com.ht.common.bean.Pager;
import com.ht.common.bean.Pager4EasyUI;
import com.ht.dao.MatterDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 举 on 2017/2/26.
 */
@Service
public class MatterServiceImpl implements MatterService {

    @Resource
    private MatterDAO matterDAO;

    @Override
    public int insert(Matter matter) {
        return matterDAO.insert(matter);
    }

    @Override
    public int delete(Matter matter) {
        return matterDAO.delete(matter);
    }

    @Override
    public int deleteById(Integer id) {
        return matterDAO.deleteById(id);
    }

    @Override
    public int update(Matter matter) {
        return matterDAO.update(matter);
    }

    @Override
    public List<Matter> queryAll() {
        return matterDAO.queryAll();
    }

    @Override
    public Matter query(Matter matter) {
        return matterDAO.query(matter);
    }

    @Override
    public Matter queryById(Integer id) {
        return matterDAO.queryById(id);
    }

    @Override
    public List<Matter> queryByPager(Pager4EasyUI<Matter> pager, Matter matter) {
        return matterDAO.queryByPager(pager, matter);
    }

    @Override
    public int count() {
        return matterDAO.count();
    }

    @Override
    public List<Matter> queryByPagerAndCriteria(Pager pager, Matter matter) {
        return matterDAO.queryByPagerAndCriteria(pager, matter);
    }

    @Override
    public int countByCriteria(Matter matter) {
        return matterDAO.countByCriteria(matter);
    }

    @Override
    public List<Matter> queryMC(int id) {
        return matterDAO.queryMC(id);
    }


}
