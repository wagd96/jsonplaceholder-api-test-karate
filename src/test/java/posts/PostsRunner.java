package posts;

import com.intuit.karate.junit5.Karate;

public class PostsRunner {
    /*@Karate.Test
    Karate testGetPosts() {
        return Karate.run("get-posts").tags("@GetPosts").relativeTo(getClass());
    }

    @Karate.Test
    Karate testPostPosts() {
        return Karate.run("create-posts").tags("@CreatePosts").relativeTo(getClass());
    }*/

    @Karate.Test
    Karate testPostPosts() {
        return Karate.run("update-posts").tags("@UpdatePosts").relativeTo(getClass());
    }

}
