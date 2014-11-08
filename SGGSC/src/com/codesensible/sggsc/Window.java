package com.codesensible.sggsc;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.preference.PreferenceManager;

public class Window extends Activity {
	
	@Override
	protected void onCreate(Bundle Darshanapp) {
		// TODO Auto-generated method stub
		super.onCreate(Darshanapp);
		setContentView(R.layout.window);
		
		

	SharedPreferences getPrefs	=PreferenceManager.getDefaultSharedPreferences(getBaseContext());
	

		Thread timer= new Thread(){
			public void run(){
				try{
					sleep(1500);
				} catch(InterruptedException e){
					e.printStackTrace();
				}
				finally{
					Intent openMainActivity = new Intent(Window.this, MainActivity.class);
					startActivity(openMainActivity);
				}
			}
			};
			timer.start();
	
	}

	@Override
	protected void onPause() {
		// TODO Auto-generated method stub
		super.onPause();
	
	finish();
	}

}

