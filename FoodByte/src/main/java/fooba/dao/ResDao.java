package fooba.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import fooba.VO.FoodmenuVO;
import fooba.VO.OrderViewVO;
import fooba.VO.RestaurantVO;
import fooba.VO.ReviewVO;
import fooba.util.Dbman;
import fooba.util.Paging;


public class ResDao {
	private ResDao() {}
	private static ResDao itc = new ResDao();
	public static ResDao getInstance() {return itc;}
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;


	public RestaurantVO getResInfo(int rseq) {
		RestaurantVO rvo=new RestaurantVO();
		con = Dbman.getConnection();
		String sql = "select*from restaurant where rseq=?"; 
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rseq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
			rvo.setRname(rs.getString("rname"));
			rvo.setOwnername(rs.getString("ownername"));
			rvo.setRphone(rs.getString("rphone"));
			rvo.setRaddress(rs.getString("raddress"));
			rvo.setRimage(rs.getString("rimage"));
			rvo.setContent(rs.getString("content"));
			rvo.setHash(rs.getString("hash"));
			rvo.setRseq(rs.getInt("rseq"));
			rvo.setRbiznum(rs.getInt("biznum"));
			rvo.setKind(rs.getInt("kind"));
			rvo.setRtip(rs.getInt("rtip"));
			}
		} catch (SQLException e) {e.printStackTrace();}
		finally {Dbman.close(con, pstmt, rs);}
		return rvo;
	}


	public ArrayList<FoodmenuVO> foodList(int rseq) {
		ArrayList<FoodmenuVO> list= new ArrayList<>();
		con = Dbman.getConnection();
		String sql="select*from foodmenu where rseq=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, rseq);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FoodmenuVO fvo=new FoodmenuVO();
				fvo.setRseq(rs.getInt("rseq"));
				fvo.setFseq(rs.getInt("fseq"));
				fvo.setFname(rs.getString("fname"));
				fvo.setFprice(rs.getInt("fprice"));
				fvo.setFimage(rs.getString("fimage"));
				fvo.setFcontent(rs.getString("fcontent"));
				fvo.setFside1(rs.getString("fside1"));
				fvo.setFsideprice1(rs.getInt("fsideprice1"));
				fvo.setFside2(rs.getString("fside2"));
				fvo.setFsideprice2(rs.getInt("fsideprice2"));
				fvo.setFside3(rs.getString("fside3"));
				fvo.setFsideprice3(rs.getInt("fsideprice3"));	
				list.add(fvo);
			}
		} catch (SQLException e) {e.printStackTrace();
		}finally {Dbman.close(con, pstmt, rs);}
		
		return list;
	}


	public RestaurantVO getRes(String rid) {
		RestaurantVO rvo=null;
		
		con=Dbman.getConnection();
		String sql="select * from restaurant where rid=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, rid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				rvo=new RestaurantVO();
				rvo.setRid(rs.getString("rid"));
				rvo.setRname(rs.getString("rname"));
				rvo.setRpwd(rs.getString("rpwd"));
				rvo.setRphone(rs.getString("rphone"));
				rvo.setRimage(rs.getString("rimage"));
				rvo.setRaddress(rs.getString("raddress"));
				rvo.setContent(rs.getString("content"));
				rvo.setHash(rs.getString("hash"));
				rvo.setOwnername(rs.getString("ownername"));
				rvo.setRseq(rs.getInt("rseq"));
				rvo.setRbiznum(rs.getInt("rbiznum"));
				rvo.setKind(rs.getInt("kind"));
				rvo.setRtip(rs.getInt("rtip"));
				rvo.setRyn(rs.getInt("ryn"));
				
			}
			
		} catch (SQLException e) {e.printStackTrace();
		}finally {Dbman.close(con, pstmt, rs);}
		
		return rvo;
	}


	public int insertRes(RestaurantVO rvo) {
		int result=0;
		String sql="insert into restaurant(rid, rpwd, rname, ownername, rphone, raddress,rimage,  content,hash, rseq, rbiznum, kind, rtip)"
				+ " values(?,?,?,?,?,?,?,?,?,restaurant_seq.nextVal,?,?,?)";
		con=Dbman.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,rvo.getRid() );
			pstmt.setString(2,rvo.getRpwd());
			pstmt.setString(3,rvo.getRname());
			pstmt.setString(4,rvo.getOwnername() );
			pstmt.setString(5,rvo.getRphone() );
			pstmt.setString(6,rvo.getRaddress() );
			pstmt.setString(7,rvo.getRimage() );
			pstmt.setString(8,rvo.getContent() );
			pstmt.setString(9,rvo.getHash());
			pstmt.setInt(10, rvo.getRbiznum());
			pstmt.setInt(11, rvo.getKind());
			pstmt.setInt(12, rvo.getRtip());
			result=pstmt.executeUpdate();
			
			
		} catch (SQLException e) {e.printStackTrace();
		}finally {Dbman.close(con, pstmt, rs);}
		
		return result;
	}


	public void updateRes(RestaurantVO rvo) {
		String sql="update restaurant set  rpwd=?, rname=?, ownername=?, rphone=?, raddress=?, rimage=? ,  content=? ,hash=?,  kind=? , rtip=?"
				+ " where id=?";
		con=Dbman.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,rvo.getRpwd());
			pstmt.setString(2,rvo.getRname());
			pstmt.setString(3,rvo.getOwnername() );
			pstmt.setString(4,rvo.getRphone() );
			pstmt.setString(5,rvo.getRaddress() );
			pstmt.setString(6,rvo.getRimage() );
			pstmt.setString(7,rvo.getContent() );
			pstmt.setString(8,rvo.getHash());
			pstmt.setInt(9, rvo.getKind());
			pstmt.setInt(10, rvo.getRtip());
			pstmt.setString(11,rvo.getRid() );
			pstmt.executeUpdate();
			
		} catch (SQLException e) {e.printStackTrace();
		}finally {Dbman.close(con, pstmt, rs);}
		
		
	}


	public void withDrawalRes(String rid) {
		con=Dbman.getConnection();
		String sql="update restaurant set result='3' where rid=?"; //3�� �޸�(Ż��)
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,rid);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {e.printStackTrace();
		}finally {Dbman.close(con, pstmt, rs);}
	}


	public int getAllCount(int rseq) {
		int count=0;
		con=Dbman.getConnection();
		String sql="select count(*) as cnt from review where rseq=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, rseq);
			rs=pstmt.executeQuery();
			if(rs.next())count=rs.getInt("cnt");
		} catch (SQLException e) {	e.printStackTrace();
		}finally {Dbman.close(con, pstmt, rs);}
		
		return count;
	}


	
		public ArrayList<ReviewVO> selectReview(int rseq ,Paging paging) {
			ArrayList<ReviewVO> list=new ArrayList<>();
			String sql="select*from("
					+ "select *from("
					+ "select rownum as rn, r.*from((select*from orders where rseq=? order by review_seq desc) r )"
					+ ")where rn>=?"
					+ ")where rn<=?";
			con=Dbman.getConnection();
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, rseq);
				pstmt.setInt(2,paging.getStartNum());
				pstmt.setInt(3,paging.getEndNum());
				rs=pstmt.executeQuery();
				while(rs.next()) {
					ReviewVO rvvo=new ReviewVO();
					rvvo.setReview_seq(rs.getInt("review_seq"));
					rvvo.setId(rs.getString("id"));
					rvvo.setRseq(rs.getInt("rseq"));
					rvvo.setIndate(rs.getTimestamp("indate"));
					rvvo.setStar(rs.getInt("star"));
					rvvo.setImages(rs.getString("image"));
					rvvo.setContent(rs.getString("content"));
					rvvo.setOseq(rs.getInt("Oseq"));
					rvvo.setReply(rs.getString("reply"));
					rvvo.setReplyyn(rs.getInt("replyyn"));
					list.add(rvvo);
				}
			} catch (SQLException e) {	e.printStackTrace();
			}finally {Dbman.close(con, pstmt, rs);}
			return list;
		}


		public void updateReply(ReviewVO rvvo) {
			con=Dbman.getConnection();
			String sql="update reivew set reply=?,replyyn='1' where rseq=?";
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, rvvo.getReply());
				pstmt.setInt(2, rvvo.getRseq());
				pstmt.executeUpdate();
			} catch (SQLException e) {	e.printStackTrace();
			}finally {Dbman.close(con, pstmt, rs);}
		}


		public ArrayList<OrderViewVO> selectOrdersByRseq(Integer rseq) {
			ArrayList<OrderViewVO> list=new ArrayList<>();
			String sql="select*from order_view where rseq=? order by result asc, oseq desc";
			con=Dbman.getConnection();
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, rseq);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					OrderViewVO ovo=new OrderViewVO();
					ovo.setFsideprice1(rs.getInt("fsideprice"));
					ovo.setFsideprice2(rs.getInt("fsideprice"));
					ovo.setFsideprice3(rs.getInt("fsideprice"));
					ovo.setFside1(rs.getString("fside1"));
					ovo.setFside2(rs.getString("fside2"));
					ovo.setFside3(rs.getString("fside3"));
					ovo.setFprice(rs.getInt("fprice"));
					ovo.setFname(rs.getString("fname"));
					ovo.setMphone(rs.getString("mphone"));
					ovo.setMadd2(rs.getString("madd2"));
					ovo.setMadd1(rs.getString("madd1"));
					ovo.setNick(rs.getString("nick"));
					ovo.setSideyn3(rs.getInt("sideyn3"));
					ovo.setSideyn2(rs.getInt("sideyn2"));
					ovo.setSideyn1(rs.getInt("sideyn1"));
					ovo.setFseq(rs.getInt("fseq"));
					ovo.setResult(rs.getInt("result"));
					ovo.setQuantity(rs.getInt("quantity"));
					ovo.setOseq(rs.getInt("oseq"));
					ovo.setIndate(rs.getTimestamp("indate"));
					ovo.setId(rs.getString("id"));
					ovo.setRideryn(rs.getInt("rideryn"));
					ovo.setPlasticyn(rs.getInt("plasticyn"));
					ovo.setPayment(rs.getInt("payment"));
					ovo.setOadd1(rs.getString("oadd1"));
					ovo.setOadd2(rs.getString("oadd2"));
					ovo.setOphone(rs.getString("ophone"));
					ovo.setOdseq(rs.getInt("odseq"));
					ovo.setTotalprice(rs.getInt("totalprice"));
					list.add(ovo);	
				}
			} catch (SQLException e) {	e.printStackTrace();
			} finally {Dbman.close(con, pstmt, rs);
			}
			return list;
		}

		public void updateFoodMenu(FoodmenuVO fvo) {
			String sql="update foodmenu set fname=?, fprice=?, fimage=?, fcontent=?, fside1=?, fsideprice1=?,"
					+ " fside2=?, fsideprice2=?, fside3=?, fsideprice3=? where fseq=?";
			con=Dbman.getConnection();
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1,fvo.getFname());
				pstmt.setInt(2,fvo.getFprice());
				pstmt.setString(3,fvo.getFimage() );
				pstmt.setString(4,fvo.getFcontent() );
				pstmt.setString(5,fvo.getFside1() );
				pstmt.setInt(6,fvo.getFsideprice1() );
				pstmt.setString(7,fvo.getFside2() );
				pstmt.setInt(8,fvo.getFsideprice2());
				pstmt.setString(9, fvo.getFside3());
				pstmt.setInt(10, fvo.getFsideprice3());
				pstmt.setInt(11, fvo.getFseq());
				pstmt.executeUpdate();
				
			} catch (SQLException e) {e.printStackTrace();
			} finally {Dbman.close(con, pstmt, rs);			
		}
		
		}

		public void addFoodMenu(FoodmenuVO fvo) {
			String sql="insert into foodmenu(rseq,fseq,fname,fprice,fimage,fcontent,fside1,fsideprice1,fside2,fsideprice2,fside3,fsideprice3)"
					+ "values(?,foodmenu_seq.nextVal,?,?,?,?,?,?,?,?,?,?)";
			con=Dbman.getConnection();
			try {
				pstmt=con.prepareStatement(sql);
				pstmt=con.prepareStatement(sql);
	            pstmt.setInt(1,fvo.getRseq());
	            pstmt.setString(2, fvo.getFname());
	            pstmt.setInt(3, fvo.getFprice());
	            pstmt.setString(4, fvo.getFimage());
	            pstmt.setString(5, fvo.getFcontent());
	            pstmt.setString(6, fvo.getFside1());
	            pstmt.setInt(7,fvo.getFsideprice1());
	            pstmt.setString(8, fvo.getFside2());
	            pstmt.setInt(9,fvo.getFsideprice2());
	            pstmt.setString(10, fvo.getFside3());
	            pstmt.setInt(11,fvo.getFsideprice3());    
	            pstmt.executeUpdate();
		
			} catch (SQLException e) {e.printStackTrace();
			} finally {Dbman.close(con, pstmt, rs);
		}
  }
}
