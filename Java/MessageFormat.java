public static String concat(String... strings) {
		String strOut = "";
		try {
			StringBuilder message = StringBuilder.class.newInstance();
			for (String strPart : strings) {
				message.append(strPart);
			}
			strOut = message.toString();
		} catch (InstantiationException | IllegalAccessException e) {
			Logs.LOG_ERRORES.error("StringUtil: no se ha podido concatenar las cadenas de texto. >> {}", e.getMessage());
		}
		return strOut;
	}
