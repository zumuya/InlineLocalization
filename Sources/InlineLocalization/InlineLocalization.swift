/**
# InlineLocalization: InlineLocalization.swift

Copyright © 2020-2022 zumuya
Permission is hereby granted, free of charge, to any person obtaining a copy of this software
and associated documentation files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial
portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR
APARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
**/

import Foundation

public struct Language: RawRepresentable, Hashable
{
	public init(rawValue: String)
	{
		self.rawValue = rawValue
	}
	public var rawValue: String
	
	public static let english = Self(rawValue: "en")
	public static let japanese = Self(rawValue: "ja")
}

extension String
{
	/// Returns `nil` only when `localizationDictionary` is empty.
	public init?(localizedIn localizationDictionary: [Language: String])
	{
		if let preferred = Bundle.preferredLocalizations(from: localizationDictionary.keys.map { $0.rawValue }, forPreferences: Bundle.main.preferredLocalizations).first, let value = localizationDictionary[.init(rawValue: preferred)] {
			self = value
		} else {
			guard let value = localizationDictionary.values.first else {
				return nil
			}
			self = value
		}
	}
}
