package dao.impl;

import model.Record;
import dao.RecordDao;

import org.springframework.stereotype.Repository;

@Repository
public class RecordDaoImpl extends GenericDaoImpl<Record, Integer> implements RecordDao {
}