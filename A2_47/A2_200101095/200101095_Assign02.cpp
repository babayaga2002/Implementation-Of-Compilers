/* Compile this code in LINUX g++ environemnt */

/* 
Sidharth Choudhary
200101095
*/


#include<bits/stdc++.h>
using namespace std;    

//Some global variables
unordered_map<string,string> optab;
unordered_map<string,string> symtab;

ifstream fin;
ofstream fout;
string PROG_LENGTH;
string START_ADDRESS;

//HELPER FUNCTIONS START

//convert an integer(in base 10) to a Hexadecimal number (returning a string)
string BaseDeciToHexa(int x)
{
    string result ="";  
    while(x) 
    {    
        int temp=x%16;
        if (temp<10)
        {
            result.push_back('0'+temp);
        }
    	else
        {
            result.push_back('A'+temp-10);
        }
        x/=16;       
    } 
    reverse(result.begin(),result.end());
    return result;
}

//convert a hexadecimal number (given by a string) to base 10(integer)
int BaseHexaToDeci(string s)
{
    int ans=0;
    int base=1;

    for (int i=s.size()-1;i>=0;i--)
    {
        if (s[i] >= '0' && s[i] <= '9') {
            ans += (s[i]-'0') * base;
        }
 
        else if (s[i] >= 'A' && s[i] <= 'F') {
            ans += (s[i]-'A'+10) * base;
        }
        base*=16;
    }
    return ans;
}

//add two hexadecimal number strings
string AddTwoHexaString(string n1, string n2) 
{ 
	return BaseDeciToHexa(BaseHexaToDeci(n1)+BaseHexaToDeci(n2));
} 

//subtract two hexadecimal number strings
string SubTwoHexaString(string n1, string n2) 
{ 
	return BaseDeciToHexa(BaseHexaToDeci(n1)-BaseHexaToDeci(n2));
}

//initialise the optab map
void InitOPTAB()
{
    optab["ADD"] = "18";
    optab["SUB"] = "1C";
    optab["MUL"] = "20";
    optab["DIV"] = "24";
    optab["COMP"] = "28";
    optab["JMP"] = "FF";
    optab["JLE"] = "7E";
    optab["JE"] = "74";
    optab["JGE"] = "7D";
    optab["JNE"] = "75";
    optab["JL"] = "7C";
    optab["JG"] = "7F";
    optab["MOV"] = "88";
    optab["CALL"] = "E8";
    optab["RET"] = "C3";
    optab["PUSH"] = "6A";
    optab["POP"] = "8F";
    optab["LDA"] = "00";
    optab["LDX"] = "04";
    optab["LDL"] = "08";
    optab["STA"] = "0C";
    optab["STX"] = "10";
    optab["STL"] = "14";
    optab["LDCH"] = "50";
    optab["STCH"] = "54";
    optab["TD"] = "E0";
    optab["RD"] = "D8";
    optab["WD"] = "DC";
    optab["J"] = "3C";
    optab["JLT"] = "38";
    optab["JEQ"] = "30";
    optab["JGT"] = "34";
    optab["JSUB"] = "48";
    optab["RSUB"] = "4C";
    optab["TIX"] = "2C";
}

//This helper function will allow us to split the input read into the corresponding label,opcode and operand
void GetParamsFromLine(string line,string &label,string &opcode, string &operand)
{
	vector <string> splits; 
    stringstream ss(line); 
    string temp=""; 
    while(getline(ss, temp, ' ')) 
    { 
        splits.push_back(temp); 
    } 

    label = splits[0];
    if(label != ".")
    {
    	opcode = splits[1];
    	operand = splits[2];
    }
}

//This helper function will allow us to split the input read into the corresponding address,label,opcode and operand
void GetParamsFromLinePass2(string line,string &address,string &label,string &opcode, string &operand)
{
	vector <string> splits; 
    stringstream ss(line); 
    string temp=""; 
    while(getline(ss, temp, '\t')) 
    { 
        splits.push_back(temp); 
    } 

    address = splits[0];
    label = splits[1];
    opcode = splits[2];
    operand = splits[3];
}

// HELPER FUNCTIONS END

//Code for the first pass, according to the pseudocode given in the prescribed book
void pass1()
{
    fout.open("intermediate.txt");
    fin.open("input.txt");

    string LOCCTR,CUR_LOC;
    bool error=false;

    //read the first line
    string curr_line="";
    getline(fin, curr_line);

    //split it into label,opcode and operand
    string label,opcode,operand;
    GetParamsFromLine(curr_line,label,opcode,operand);

    
    if(opcode=="START")
    {
        //store the starting address of the input file
        START_ADDRESS = operand;
        LOCCTR = START_ADDRESS;
        fout<<LOCCTR<<"\t"<<label<<"\t"<<opcode<<"\t"<<operand<<"\n";

        CUR_LOC=LOCCTR;
        getline(fin, curr_line);
        GetParamsFromLine(curr_line,label,opcode,operand);
    }        
    else
    {
        //if START not found
        START_ADDRESS="0000";
        LOCCTR="0000";
    }

    while (opcode!="END")
    {
        //if the line is not a comment
        if (label!=".")
        {
            //if the label is not empty
            if (label!="*")
            {
                //check if the label already exists, else store it
                if (symtab.find(label)!=symtab.end())
                {
                    error=true;
                    cout<<"ERROR: DUPLICATE SYMBOL"<<endl;
                }
                else
                {
                    symtab[label]=LOCCTR;
                }
            }
            //figure out how much further to move LOCCTR, based on the current line's opcode
            if (optab.find(opcode)!=optab.end())
            {
                LOCCTR = AddTwoHexaString(LOCCTR,"3");
            }
            else if(opcode=="WORD") 
            {
                LOCCTR = AddTwoHexaString(LOCCTR,"3");
            }
            else if(opcode=="RESW")
            {
                LOCCTR = AddTwoHexaString(LOCCTR,BaseDeciToHexa(3*stoi(operand)));
            }
            else if(opcode=="RESB")
            {
                LOCCTR = AddTwoHexaString(LOCCTR,BaseDeciToHexa(stoi(operand)));
            }  
            else if(opcode=="BYTE")
            {
                int len=0;
                if(operand[0]=='C')
                    len = (operand.length()-3);
                else
                	len = (operand.length()-3)/2;
                    
                LOCCTR = AddTwoHexaString(LOCCTR,to_string(len));
            }
            else
            {
                //opcode not found in instruction set
                error=true;
                cout<<"ERROR: INVALID OPCODE\n";
            }
            //write to intermediate file
            fout<<CUR_LOC<<"\t"<<label<<"\t"<<opcode<<"\t"<<operand<<"\n";
        }
        //update current location
        CUR_LOC=LOCCTR;
        getline(fin, curr_line);
        GetParamsFromLine(curr_line,label,opcode,operand);
    }

    //write the last line
    fout<<"*\t"<<label<<"\t"<<opcode<<"\t"<<operand<<"\n";
    fin.close();
    fout.close();
    //store the program length
    PROG_LENGTH=SubTwoHexaString(LOCCTR,START_ADDRESS);

}

void pass2()
{
    ofstream fobj;
    fin.open("intermediate.txt");
    fout.open("listing.txt");
    fobj.open("output.o");
    //open intermediate file for reading, and listing,output files for writing
    bool error=false,RES_WORD=false;
    string address, label, opcode, operand;
    string text_record,obj_record;
    string HEADER_LABEL, CUR_ADDRESS;
    int increment=0;
    int cur_text_record_len=0;
    stringstream ss_text_record(text_record),object_ss(obj_record);

    //read the first line and split it into address, label, opcode and operand
    string curr_line="";
    getline(fin, curr_line);
    GetParamsFromLinePass2(curr_line,address,label,opcode,operand);
    HEADER_LABEL=label;
    if(opcode=="START")
	{
		fout<<address<<"\t"<<label<<"\t"<<opcode<<"\t"<<operand<<"\t\n";
        getline(fin, curr_line);
        GetParamsFromLinePass2(curr_line,address,label,opcode,operand);
	}

    //write header line to object file
    fobj<<"H^"<<HEADER_LABEL<<"\t"<<"^"<<setw(6)<<setfill('0')<<START_ADDRESS<<"^"<<setw(6)<<setfill('0')<<PROG_LENGTH<<"\n";
    CUR_ADDRESS=address;

    while (opcode!="END")
    {
        //if the line is not a comment
        if (label!=".")
        {
            string opcode_val;
            //find opcode from the table
            if (optab.find(opcode)!=optab.end())
            {
                opcode_val = optab[opcode];
                bool rel=false;
                string real_operand=operand;
                //if operand has a symbol
                if (operand!="*")
                {
                    //find if it uses indirect addressing
					if(operand.find(",") != string::npos)
					{
						real_operand=operand.substr(0,operand.find(","));
                        rel=true;
					}
                    //if symbol found in symtab
					if(symtab.find(real_operand) != symtab.end())
					{
                        string symtab_val=symtab[real_operand];
                        if (rel)
                        {
                            object_ss <<opcode_val<<setw(4)<<setfill('0')<<AddTwoHexaString(symtab[real_operand],"8000");
                        }  
                        else
                        { 
                            object_ss << opcode_val<<setw(4)<<setfill('0')<<symtab_val;
                        }  
					}
					else
					{
                        //symbol not found in symtab
                        error=true;
                        object_ss << opcode_val<<"0000";
                        cout<<"ERROR: SYMBOL UNDEFINED\n";
					}
                }
                //if operand is not a symbol
                else
                {
                    object_ss << opcode_val<<"0000";
                }

                increment=3;
            }
            else if (opcode=="BYTE"||opcode=="WORD")
            {
                if (opcode=="BYTE")
                {
                    if(operand[0]=='C')
                    {
                        for(int i=2;i<operand.size()-1;i++)
                        {
                            object_ss<<BaseDeciToHexa((int)operand[i]);
                        }
                        increment=operand.length()-3;
                    }
                    else if(operand[0]=='X')
                    {
                        for(int i=2;i<operand.size()-1;i++)
                        {
                            object_ss<<(char)toupper(operand[i]);
                        }
                        increment=(operand.length()-3)/2;
                    }
                }
                else
                {
                    object_ss<<setw(6)<<setfill('0')<<BaseDeciToHexa(stoi(operand));
                    increment=3;
                }
            }
            cur_text_record_len+=increment;
            //if object code does not fit in the current text record
			if(cur_text_record_len>30)
			{
                fobj<<"T^"<<setfill('0')<<setw(6)<<CUR_ADDRESS<<"^"<<setfill('0')<<setw(2)<<BaseDeciToHexa(cur_text_record_len-increment)<<ss_text_record.str()<<"\n";
                cur_text_record_len=increment;
                CUR_ADDRESS = address;
                ss_text_record.str("");
			}
			ss_text_record<<"^"<<object_ss.str();
        }
        fout<<address<<"\t"<<label<<"\t"<<opcode<<"\t"<<operand<<"\t"<<object_ss.str()<<"\n";
        object_ss.str("");

        //get next line
        getline(fin, curr_line);
        GetParamsFromLinePass2(curr_line,address,label,opcode,operand);

        RES_WORD=false;
		if(opcode=="RESW"||opcode=="RESB")
		{
			fobj<<"T^"<<setw(6)<<setfill('0')<<CUR_ADDRESS<<"^"<<setw(2)<<setfill('0')<<BaseDeciToHexa(cur_text_record_len)<<ss_text_record.str()<<"\n";
			cur_text_record_len=0;
			ss_text_record.str("");
		}
		while(opcode=="RESW"||opcode=="RESB")
		{
			fout<<address<<"\t"<<label<<"\t"<<opcode<<"\t"<<operand<<"\n";
            getline(fin, curr_line);
            GetParamsFromLinePass2(curr_line,address,label,opcode,operand);
			RES_WORD=true;
		}
		if(RES_WORD) CUR_ADDRESS=address;
    }

    if(!RES_WORD){
    		fobj<<"T^"<<setfill('0')<<setw(6)<<CUR_ADDRESS<<"^"<<setfill('0')<<setw(2)<<BaseDeciToHexa(cur_text_record_len)<<ss_text_record.str()<<"\n";
    }
        //write last line
	    fobj<<"E^"<<setfill('0')<<setw(6)<<START_ADDRESS;
		fout<<address<<"\t"<<label<<"\t"<<opcode<<"\t"<<operand<<"\t\n";

        //close file i/o systems after use
		fin.close();
		fout.close();
		fobj.close();
}

void printSymTable(){
    fout.open("SymTable.txt");
    for( auto it: symtab){
        fout<<it.first<<" "<<it.second<<endl;
    }
    fout.close();
}

void printOpTable(){
    fout.open("OpTable.txt");
    for( auto it: optab){
        fout<<it.first<<" "<<it.second<<endl;
    }
    fout.close();
}

int main()
{
    //initialise the optab table, then proceed with the two passes
    InitOPTAB();
    pass1();
    pass2();
    printSymTable();
    printOpTable();
	return 0;
}

