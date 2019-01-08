package dao.impl;

import model.Address;
import dao.AddressDao;

import org.springframework.stereotype.Repository;

@Repository
public class AddressDaoImpl extends GenericDaoImpl<Address, Integer> implements AddressDao {
}
