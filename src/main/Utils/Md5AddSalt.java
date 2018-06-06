package Utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Md5AddSalt {
    /**
     * 获取MD5字符串
     */
    public static String getMD5(String content) {
        try {
            MessageDigest digest = MessageDigest.getInstance("MD5");
            digest.update(content.getBytes());
            return getHashString(digest);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }

    private static final String SALT = "0fdfa5e5a88bebae640a5d88e7c84708";

    /**
     * 获取加盐的MD5字符串
     */
    public static String getMD5WithSalt(String content) {
        return getMD5(getMD5(content) + SALT);
    }

    private static String getHashString(MessageDigest digest) {
        StringBuilder builder = new StringBuilder();
        for (byte b : digest.digest()) {
            builder.append(Integer.toHexString((b >> 4) & 0xf));
            builder.append(Integer.toHexString(b & 0xf));
        }
        return builder.toString();
    }
}
