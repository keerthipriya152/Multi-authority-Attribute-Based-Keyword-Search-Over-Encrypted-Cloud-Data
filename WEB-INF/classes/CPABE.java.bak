package abe;

import it.unisa.dia.gas.jpbc.Element;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import it.unisa.dia.gas.plaf.jpbc.pairing.PairingFactory;
import it.unisa.dia.gas.plaf.jpbc.pairing.a.TypeACurveGenerator;
import javax.crypto.Cipher;
import it.unisa.dia.gas.jpbc.*;
import abe.CPABEImpl;
import abe.Ciphertext;
import abe.MasterKey;
import abe.Parser;
import abe.Policy;
import abe.PublicKey;
import abe.SecretKey;
import abe.SerializeUtils;
import abe.AES;

public class CPABE {

	public static final String Default_PKFileName = "PublicKey";
	public static final String Default_MKFileName = "MasterKey";
	public static final String Default_SKFileName = "SecretKey";
	public static final String Ciphertext_Suffix  = ".cpabe";
	public static final String Error_PK_Missing = "Must set the name of the file that holds the PublicKey!"; 
	public static final String Error_MK_Missing = "Must set the name of the file that holds the MasterKey!"; 
	public static final String Error_SK_Missing = "Must set the name of the file that holds the SecretKey!"; 
	public static final String Error_EncFile_Missing = "Must set the file to be encrypted!";
	public static final String Error_Policy_Missing = "Must set a policy for the file to be encrypted!";
	public static final String Error_Attributes_Missing = "Must set the attributes of the key to be generated!";
	public static final String Error_Ciphertext_Missing = "Must set the name of the file that to be decrypted!";
	public static final String Error_Enc_Directory = "Can not encrypt a directory!";


Element g;
private Element privateKey;		
private Element publicKey;
private Element masterKey;	
private Element	aapublicKey;
private Element secretkey;
	 Pairing pairing;
	
	public static void setup(String PKFileName, String MKFileName){
		PKFileName = isEmptyString(PKFileName) ? Default_PKFileName : PKFileName;
		MKFileName = isEmptyString(MKFileName) ? Default_MKFileName : MKFileName;
		CPABEImpl.setup(PKFileName, MKFileName);
	}
	
	public static void encrypt(String encFileName, String policy, 
			               String outputFileName, String PKFileName){
		if(isEmptyString(encFileName)){
			err(Error_EncFile_Missing);
			return;
		}
		File encFile = new File(encFileName);
		if(!encFile.exists()){
			err(Error_EncFile_Missing);
			return;
		}
		if(encFile.isDirectory()){
			err(Error_Enc_Directory);
			return;
		}
		try {
			outputFileName = isEmptyString(outputFileName) ? 
					encFile.getCanonicalPath() + Ciphertext_Suffix : outputFileName;
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(isEmptyString(policy)){
			err(Error_Policy_Missing);
			return;
		}
		if(isEmptyString(PKFileName)){
			err(Error_PK_Missing);
			return;
		}
		PublicKey PK = SerializeUtils.unserialize(PublicKey.class, new File(PKFileName));
		if(PK == null){
			err(Error_PK_Missing);
			return;
		}
		Parser parser = new Parser();
		Policy p = parser.parse(policy);
		if(p == null){
			err(Error_Policy_Missing);
			return;
		}
		CPABEImpl.enc(encFile, p, PK, outputFileName);
	}
	
	public static void keygen(String[] attrs, String PKFileName, String MKFileName, String SKFileName){
		if(attrs == null || attrs.length == 0){
			err(Error_Attributes_Missing);
			return;
		}
		if(isEmptyString(PKFileName)){
			err(Error_PK_Missing);
			return;
		}
		if(isEmptyString(MKFileName)){
			err(Error_MK_Missing);
			return;
		}
		SKFileName = isEmptyString(SKFileName) ? Default_SKFileName : SKFileName;
		PublicKey PK = SerializeUtils.unserialize(PublicKey.class, new File(PKFileName));
		if(PK == null){
			err(Error_PK_Missing);
			return;
		}
		MasterKey MK = SerializeUtils.unserialize(MasterKey.class, new File(MKFileName));
		CPABEImpl.keygen(attrs, PK, MK, SKFileName);
	}
	
	public static void decrypt(String ciphertextFileName, String PKFileName, String SKFileName){
		if(isEmptyString(ciphertextFileName)){
			err(Error_Ciphertext_Missing);
			return;
		}
		if(isEmptyString(PKFileName)){
			err(Error_PK_Missing);
			return;
		}
		if(isEmptyString(SKFileName)){
			err(Error_SK_Missing);
			return;
		}

		DataInputStream dis = null;
		try {
			dis = new DataInputStream(new FileInputStream(new File(ciphertextFileName)));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
//		Ciphertext ciphertext = SerializeUtils.unserialize(Ciphertext.class, new File(ciphertextFileName));
		Ciphertext ciphertext = SerializeUtils._unserialize(Ciphertext.class, dis);
		if(ciphertext == null){
			err(Error_Ciphertext_Missing);
			return;
		}
		PublicKey PK = SerializeUtils.unserialize(PublicKey.class, new File(PKFileName));
		if(PK == null){
			err(Error_PK_Missing);
			return;
		}
		SecretKey SK = SerializeUtils.unserialize(SecretKey.class, new File(SKFileName));
		if(SK == null){
			err(Error_SK_Missing);
			return;
		}
		
		String output = null;
		if(ciphertextFileName.endsWith(".cpabe")){
			int end = ciphertextFileName.indexOf(".cpabe");
			output = ciphertextFileName.substring(0, end);
		}
		else{
			output = ciphertextFileName + ".out";
		}
		File outputFile = CPABEImpl.createNewFile(output);
		OutputStream os = null;
		try {
			os =  new FileOutputStream(outputFile);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		Element m = CPABEImpl.dec(ciphertext, SK, PK);
		AES.crypto(Cipher.DECRYPT_MODE, dis, os, m);
	}
	
public Element getPrivateKey(){

 privateKey = pairing.getZr().newRandomElement().getImmutable();

	return this.privateKey;

		}
		
public Element getMasterKey(){

		 masterKey = pairing.getZr().newRandomElement().getImmutable();

	return masterKey;
}

public Element getPublicKey(){

		 publicKey = pairing.getZr().newRandomElement().getImmutable();
 
	return publicKey;
}

public Element getAAPublicKey(){
		
	g = pairing.getG1().newRandomElement().getImmutable();
		
	 aapublicKey = g.powZn(privateKey).getImmutable();
	return aapublicKey;

		}

public static void main(String[] args) {
		CPABEImpl.debug = true;
		String encFileName = "README.md";
		String ciphertextFileName = "test.cpabe";
		String PKFileName = "PKFile";
		String MKFileName = "MKFile";
		String SKFileName = "SKFile";
		String policy = "2 of (a,b,c)";
		String[] attrs = new String[]{"a", "b"};

		setup(PKFileName, MKFileName);
		encrypt(encFileName, policy, ciphertextFileName, PKFileName);
		keygen(attrs, PKFileName, MKFileName, SKFileName);
		decrypt(ciphertextFileName, PKFileName, SKFileName);
	}

	private static void err(String s){
		System.err.println(s);
	}

	private static boolean isEmptyString(String s){
		return s == null ? true : s.trim().equals("") ? true : false;
	}	
public void setUp(){
	pairing= PairingManager.defaultPairing;
 getPublicKey();
 getMasterKey();
}
public Element keygen(String PK, String MSK,String[] attrs){
		if(attrs == null || attrs.length == 0){
			err(Error_Attributes_Missing);
		}
pairing= PairingManager.defaultPairing;
 secretkey = pairing.getZr().newRandomElement().getImmutable();

	return secretkey;

		}
}
