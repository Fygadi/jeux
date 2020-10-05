private class JsonFile{
  void JsonOption() {
    try{
      JSONObject json;
      json = loadJSONObject(sketchPath() + "/optionSnake.json");
      
      JSONObject jsonScreen = new JSONObject();
      jsonScreen = json.getJSONObject("Screen");
      fullScreen_G = jsonScreen.getBoolean("FullScreen");
      screenSizeX_G = Math.abs(jsonScreen.getInt("SizeX"));
      screenSizeY_G = Math.abs(jsonScreen.getInt("SizeY"));
      
      JSONObject jsonKey = new JSONObject();
      jsonKey = json.getJSONObject("key");
      up_G = jsonKey.getString("up").toLowerCase().toCharArray()[0];
      left_G = jsonKey.getString("left").toLowerCase().toCharArray()[0];
      down_G = jsonKey.getString("down").toLowerCase().toCharArray()[0];
      right_G = jsonKey.getString("right").toLowerCase().toCharArray()[0];
      
      JSONObject jsonAuther = new JSONObject();
      jsonAuther = json.getJSONObject("Auther");
      sizeCases_G = Math.abs(jsonAuther.getInt("sizeCases", sizeCases_G));
      
      JSONObject jsonSnake = new JSONObject();
      jsonSnake = json.getJSONObject("Snake");
      SnakeSpeed_G = Math.abs(jsonAuther.getInt("Speed", SnakeSpeed_G));
      SnakeMagnificationSpeed_G = Math.abs(jsonSnake.getInt("speed magnification", SnakeMagnificationSpeed_G));
    }
    catch(Exception e){
      JSONObject json = new JSONObject();
      
      JSONObject jsonScreen = new JSONObject();
      jsonScreen.setBoolean("FullScreen", fullScreen_G);
      jsonScreen.setInt("SizeX", Math.abs(screenSizeX_G));
      jsonScreen.setInt("SizeY", Math.abs(screenSizeY_G));
      json.setJSONObject("Screen", jsonScreen);
      
      JSONObject jsonKey = new JSONObject();
      jsonKey.setString("up", Character.toString(up_G).toLowerCase());
      jsonKey.setString("left", Character.toString(left_G).toLowerCase());
      jsonKey.setString("down", Character.toString(down_G).toLowerCase());
      jsonKey.setString("right", Character.toString(right_G).toLowerCase());
      json.setJSONObject("key", jsonKey);
      
      JSONObject jsonAuther = new JSONObject();
      jsonAuther.setInt("sizeCases", Math.abs(sizeCases_G));
      json.setJSONObject("Auther", jsonAuther);
      
      JSONObject jsonSnake = new JSONObject();
      jsonSnake.setInt("Speed", Math.abs(SnakeSpeed_G));
      jsonSnake.setInt("speed magnification", Math.abs(SnakeMagnificationSpeed_G));
      json.setJSONObject("Snake", jsonSnake);
      
      saveJSONObject(json, sketchPath() + "/optionSnake.json");
    }
  }
  
  
  
  void jsonGameNumber(){
    try{
      JSONObject json;
      json = loadJSONObject(sketchPath() + "/data/GameNumber.json");
      
      
      int tempGameNumber = json.getInt("/GameNumber");
      
      json.setInt("GameNumber: ", (tempGameNumber + 1));
      saveJSONObject(json, sketchPath() + "/data/GameNumber.json");
    } catch(Exception e){
      try{
        JSONObject json = new JSONObject();
        json.setInt("GameNumber", 1);
        saveJSONObject(json, sketchPath() + "/data/GameNumber.json");
      } catch(Exception i){
        
      }
    }
  }
  


  void txtScore(){
    try{
      Files.createFile(Paths.get(sketchPath() + "/ScoreBoard.txt"));
      
      //set the value of the game nuber to 0
      JSONObject json = new JSONObject();
      json.setInt("GameNumber", 1);
      saveJSONObject(json, sketchPath() + "/data/GameNumber.json");
    } catch (IOException e) {
      
    }
    
    try{
      JSONObject json;
      json = loadJSONObject(sketchPath() + "/data/GameNumber.json");
      
      String tempTxt = "        Game " + json.getInt("GameNumber") + "\n\nFood eats: " + Snake.numberFoodEat + "\nTime play: " + Snake.snakeX.size()  +" Secondes" + "\n--------------------------\n";
      //String tmpText = "\nPoint = " + Snake.numberFoodEat + "\n";
      Files.write(Paths.get(sketchPath() + "/ScoreBoard.txt"), tempTxt.getBytes(),  StandardOpenOption.APPEND);
    } catch (IOException e) {
      
    }
  }
}
