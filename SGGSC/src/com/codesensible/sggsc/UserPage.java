package com.codesensible.sggsc;
import java.util.ArrayList;
import java.util.List;
 


import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;
 
public class UserPage extends Activity {
    
    private String selectedCountry = null;
    private String selectedAnimal = null;
    HttpPost httppost;
	HttpResponse response;
	TextView tv;
	ProgressDialog dialog = null;
	HttpClient httpclient;
	List<NameValuePair> nameValuePairs;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.userpage);
      
        
        //get reference to the spinner from the XML layout
        Spinner spinner = (Spinner) findViewById(R.id.spinner);
        //attach the listener to the spinner
        spinner.setOnItemSelectedListener(new MyOnItemSelectedListener());
 
        //Dynamically generate a spinner data 
        createSpinnerDropDown();
        
        Button button1 = (Button) findViewById(R.id.btn_submit);
        button1.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
       
         Intent intent = new Intent(UserPage.this, One.class);
         startActivity(intent);
         
         
            }
        });
 
    }
 
    //Add animals into spinner dynamically
    private void createSpinnerDropDown() {
 
        //get reference to the spinner from the XML layout
        Spinner spinner = (Spinner) findViewById(R.id.spinner1);
        
        //Array list of animals to display in the spinner
        List<String> list = new ArrayList<String>();
        list.add("10am");
        list.add("11am");
        list.add("12am");
        list.add("1pm");
        list.add("2pm");
        list.add("3pm");
        list.add("4pm");
        
        
        //create an ArrayAdaptar from the String Array
        ArrayAdapter<String> dataAdapter = new ArrayAdapter<String>(this,
                android.R.layout.simple_spinner_item, list);
        //set the view for the Drop down list
        dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        //set the ArrayAdapter to the spinner
        spinner.setAdapter(dataAdapter);
        //attach the listener to the spinner
        spinner.setOnItemSelectedListener(new MyOnItemSelectedListener());
        
    }
 
    public class MyOnItemSelectedListener implements OnItemSelectedListener {
 
        public void onItemSelected(AdapterView<?> parent, View view, int pos, long id) {
            
            String selectedItem = parent.getItemAtPosition(pos).toString();
            
            //check which spinner triggered the listener
            switch (parent.getId()) {
            //country spinner
            case R.id.spinner:
                //make sure the country was already selected during the onCreate
                if(selectedCountry != null){
                    Toast.makeText(parent.getContext(), "Category you selected is " + selectedItem,
                    Toast.LENGTH_LONG).show();
                }
                selectedCountry = selectedItem;
                break;
            //animal spinner   
            case R.id.spinner1:
                //make sure the animal was already selected during the onCreate
                if(selectedAnimal != null){
                    Toast.makeText(parent.getContext(), "Timing selected is " + selectedItem,
                    Toast.LENGTH_LONG).show();
                }   
                selectedAnimal = selectedItem;
                break;
            }
 
            
        }
 
        public void onNothingSelected(AdapterView<?> parent) {
            // Do nothing.
        }
    }
}