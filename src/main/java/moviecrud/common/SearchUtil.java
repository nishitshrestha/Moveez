package moviecrud.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.core.io.Resource;

public class SearchUtil {

	public static String[] getTokenizedWordForSearch(String originalSearchText) {
		String tokens[] = originalSearchText.split("\\s");
		return tokens;
	}

	public List<String> getIgnoreWordsFromFilet() {

		List<String> ignoreWords = new ArrayList<String>();

		ApplicationContext appContext = new FileSystemXmlApplicationContext(
				"classpath:dispatcher-servlet.xml");
		Resource resource = appContext
				.getResource("classpath:ignore_words.txt");

		try {
			InputStream is = resource.getInputStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(is));

			String line;
			while ((line = br.readLine()) != null) {
				ignoreWords.add(line);
			}
			br.close();

		} catch (IOException e) {
			e.printStackTrace();
		}

		return ignoreWords;
	}

	public List<String> removeIgnoreWordsFromSearchQuery(String[] tokens) {
		List<String> ignoreWordsList = getIgnoreWordsFromFilet();

		List<String> filteredTokens = new ArrayList<String>();

		// remove common words from searchTokens that matches ignoreWordsList

		for (String token : tokens) {
			boolean flag = false;
			for (String igWord : ignoreWordsList) {
				if (token.toLowerCase().equals(igWord.toLowerCase())) {
					flag = true;
					break;
				}
			}// end of if
			if (flag == false) {
				filteredTokens.add(token);
			}
		}// end of if

		return filteredTokens;
	}

	public static void main(String arg[]) {
		SearchUtil sUtil = new SearchUtil();
		String searchQuery = "The Dark Knight Rises";
		String[] tokens = searchQuery.split("\\s");
		List<String> filteredTokens = sUtil
				.removeIgnoreWordsFromSearchQuery(tokens);
		for (String s : filteredTokens) {
			System.out.println("" + s);
		}
	}
}
