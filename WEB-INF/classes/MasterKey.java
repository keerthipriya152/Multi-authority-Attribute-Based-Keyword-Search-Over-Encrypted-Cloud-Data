package abe;

import abe.Serializable;
import abe.SimpleSerializable;
import it.unisa.dia.gas.jpbc.Element;

public class MasterKey implements SimpleSerializable{
	@Serializable(group="Zr")
	Element beta;
	
	@Serializable(group="G2")
	Element g_alpha;
}
