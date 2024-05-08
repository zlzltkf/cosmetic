package com.example.cosmetic.model.zzim;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//찜기능
@Repository
public class ZzimDAO {

	@Autowired
	SqlSession sqlSession;

	// 찜취소하기
	public void zzim_clear(ZzimDTO dto) {
		sqlSession.delete("zzim.zzim_clear", dto);
	}

	// 찜하기
	public void zzim_apply(ZzimDTO dto) {
		sqlSession.insert("zzim.zzim_apply", dto);
	}

	// 찜 갯수
	public int zzim_count(int z_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("z_id", z_id);
		return sqlSession.selectOne("zzim.zzim_count", map);
	}

	// 찜 리스트(마이페이지에서 확인가능)
	public List<ZzimDTO> zzim_list(String userid) {
		List<ZzimDTO> zzimlist = sqlSession.selectList("zzim.zzim_list", userid);
		return zzimlist;
	}

	// 마이페이지에서 찜리스트 삭제 가능
	public void zzim_delete(int z_id) {
		sqlSession.delete("zzim.zzim_delete", z_id);
	}

	public int zzim_Check(String userid, int z_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("z_id", z_id);
		return sqlSession.selectOne("zzim.zzim_check", map);
	}

	public List<ZzimDTO> zzim_z_id(String userid) {
		List<ZzimDTO> zzimlist = sqlSession.selectList("zzim.zzim_z_id", userid);
	//	System.out.println(zzimlist);
		return zzimlist;
	}
}
