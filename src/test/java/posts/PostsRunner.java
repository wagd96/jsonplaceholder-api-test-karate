package posts;

import com.intuit.karate.junit5.Karate;

public class PostsRunner {
    @Karate.Test
    Karate testGetPosts() {
        return Karate.run("get-posts").tags("@GetPosts").relativeTo(getClass());
    }
}
