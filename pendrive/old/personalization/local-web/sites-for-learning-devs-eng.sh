
httrack "" -O 

httrack "https://en.cppreference.com/w/" \
-O "./CppReference" \
--max-rate=50000 \
-%v \
-F "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" \
"+*.css" "+*.js" "+*.png" "+*.jpg" "+*.svg" "+*.woff" "+*.ttf" \
-n

httrack "https://www.learncpp.com/" \
-O "./LearnCPP" \
--max-rate=50000 \
-%v \
-F "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" \
"+*.css" "+*.js" "+*.png" "+*.jpg" "+*.gif" \
-n

httrack "https://learnopengl.com/" \
-O "./LearnOpenGL" \
--max-rate=50000 \
-%v \
-F "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" \
"+*.css" "+*.js" "+*.png" "+*.jpg" \
-n

httrack "https://open.gl/" \
-O "./OpenGL_Guide" \
--max-rate=50000 \
-%v \
-F "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" \
"+*.css" "+*.js" "+*.png" \
-n

httrack "https://tutorial.math.lamar.edu/" \
-O "./PaulMathNotes" \
--max-rate=50000 \
-%v \
-F "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" \
"+*.css" "+*.js" "+*.png" "+*.jpg" "+*.pdf" \
-n

httrack "https://www.deeplearningbook.org/" \
-O "./DeepLearningBook" \
--max-rate=50000 \
-%v \
-F "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" \
"+*.css" "+*.png" "+*.jpg" \
-n

httrack "https://www.electronics-tutorials.ws/" \
-O "./ElectronicsTutorials" \
--max-rate=50000 \
-%v \
-F "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" \
"+*.css" "+*.js" "+*.png" "+*.jpg" "+*.gif" \
-n

httrack "https://learnxinyminutes.com/" \
-O "./LearnXinY" \
--max-rate=50000 \
-%v \
-F "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" \
"+*.css" "+*.js" "+*.png" \
-n

httrack "https://www.geeksforgeeks.org/ethical-hacking/cyber-security-tutorial/" \
-O "./G4G_EthicalHacking" \
--max-rate=40000 \
-%v \
-F "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" \
"+*.css" "+*.js" "+*.png" "+*.jpg" \
"+www.geeksforgeeks.org/ethical-hacking/*" \
"-www.geeksforgeeks.org/*" \
-n

httrack "https://www.w3schools.com/" \
-O "./W3Schools" \
--max-rate=50000 \
-%v \
-F "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" \
"+*.css" "+*.js" "+*.png" "+*.jpg" "+*.woff" \
"+*.w3schools.com/*" \
-n

httrack "https://www.allaboutcircuits.com/textbook/" \
-O "./AllAboutCircuits_Book" \
--max-rate=50000 \
-%v \
-F "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" \
"+*.css" "+*.js" "+*.png" "+*.jpg" \
"+www.allaboutcircuits.com/textbook/*" \
"-www.allaboutcircuits.com/*" \
-n

httrack "https://www.freertos.org/Documentation/00-Overview" \
-O "./FreeRTOS_Docs" \
--max-rate=50000 \
-%v \
-F "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" \
"+*.css" "+*.js" "+*.png" "+*.jpg" \
"+www.freertos.org/Documentation/*" \
-n

httrack "https://maker.pro/tutorials" "https://maker.pro/projects" \
-O "./MakerPro" \
--max-rate=50000 \
-%v \
-F "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" \
"+*.css" "+*.js" "+*.png" "+*.jpg" \
"+maker.pro/tutorials/*" \
"+maker.pro/projects/*" \
-n

httrack "https://controllerstech.com/stm32-tutorials/" \
-O "./ControllerTech_STM32" \
--max-rate=50000 \
-%v \
-F "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" \
"+*.css" "+*.js" "+*.png" "+*.jpg" "+*.jpeg" "+*.gif" "+*.svg" "+*.woff" "+*.ttf" \
"+controllerstech.com/*" \
-n

httrack "https://deepbluembedded.com/" \
-O "./DeepBlueEmbedded" \
--max-rate=50000 \
-%v \
-F "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" \
"+*.css" "+*.js" "+*.png" "+*.jpg" "+*.gif" "+*.svg" "+*.woff" \
"+deepbluembedded.com/*" \
-n

httrack "https://doc.rust-lang.org/book/" \
-O "./Rust_Book" \
--max-rate=60000 \
-%v \
-F "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" \
"+*.css" "+*.js" "+*.png" "+*.svg" "+*.woff" \
"+doc.rust-lang.org/book/*" \
"-doc.rust-lang.org/*" \
-n

httrack "https://rust-classes.com/" \
-O "./Rust_Classes" \
--max-rate=50000 \
-%v \
-F "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" \
"+*.css" "+*.js" "+*.png" "+*.jpg" \
"+rust-classes.com/*" \
-n
