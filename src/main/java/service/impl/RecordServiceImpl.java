package service.impl;

import dao.GenericDao;

import model.Record;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import service.RecordService;

@Service
public class RecordServiceImpl extends GenericServiceImpl<Record, Integer> implements RecordService {

    @Override
    @Autowired
    void setGenericDao(GenericDao<Record, Integer> genericDao) {
        super.genericDao = genericDao;
    }
}