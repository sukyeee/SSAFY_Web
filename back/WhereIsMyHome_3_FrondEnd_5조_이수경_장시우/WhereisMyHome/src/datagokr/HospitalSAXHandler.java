package datagokr;

import java.util.ArrayList;
import java.util.List;

import org.xml.sax.Attributes;
import org.xml.sax.helpers.DefaultHandler;

public class HospitalSAXHandler extends DefaultHandler {
    private List<Hospital> hospitalList = new ArrayList<> ();

    private String temp;
    private Hospital hospital;

    public void startElement (String uri, String localName, String qName, Attributes att) {
        if (qName.equals("item")) {
            hospital = new Hospital();
        }
    }

    public void endElement (String uri, String localName, String qName) {
        if (qName.equals("hospitalNm")) {
            hospital.setHospitalNm(temp);
        } 
        else if (qName.equals("hospitalTel")) {
        	hospital.setHospitalTel(temp);
        }
        else if (qName.equals("sido")) {
        	hospital.setSido(temp);
        }
        else if (qName.equals("sigungu")) {
        	hospital.setSigungu(temp);
        }
        else if (qName.equals("item")) {
            hospitalList.add(hospital);
        }
    }

    public void characters (char[] ch, int start, int length) {
        temp=new String (ch, start, length);
    }

    public List<Hospital> getHospitalList () {
        return hospitalList;
    }
}