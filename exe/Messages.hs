{-# LANGUAGE RankNTypes #-}
module Messages where

import Data.Aeson
import Language.Haskell.LSP.Messages
import Language.Haskell.LSP.Types

handleServerMessage
    :: forall a.
       (forall b c. RequestMessage ServerMethod b c -> a)
    -> (forall d. ResponseMessage d -> a)
    -> (forall e. NotificationMessage ServerMethod e -> a)
    -> FromServerMessage
    -> a
handleServerMessage request response notification msg = case msg of
    (ReqRegisterCapability       m) -> request m
    (ReqApplyWorkspaceEdit       m) -> request m
    (ReqShowMessage              m) -> request m
    (ReqUnregisterCapability     m) -> request m
    (ReqCustomServer             m) -> request m
    (ReqWorkDoneProgressCreate   m) -> request m
    (RspInitialize               m) -> response m
    (RspShutdown                 m) -> response m
    (RspHover                    m) -> response m
    (RspCompletion               m) -> response m
    (RspCompletionItemResolve    m) -> response m
    (RspSignatureHelp            m) -> response m
    (RspDefinition               m) -> response m
    (RspFindReferences           m) -> response m
    (RspDocumentHighlights       m) -> response m
    (RspDocumentSymbols          m) -> response m
    (RspWorkspaceSymbols         m) -> response m
    (RspCodeAction               m) -> response m
    (RspCodeLens                 m) -> response m
    (RspCodeLensResolve          m) -> response m
    (RspDocumentFormatting       m) -> response m
    (RspDocumentRangeFormatting  m) -> response m
    (RspDocumentOnTypeFormatting m) -> response m
    (RspRename                   m) -> response m
    (RspExecuteCommand           m) -> response m
    (RspError                    m) -> response m
    (RspDocumentLink             m) -> response m
    (RspDocumentLinkResolve      m) -> response m
    (RspWillSaveWaitUntil        m) -> response m
    (RspTypeDefinition           m) -> response m
    (RspImplementation           m) -> response m
    (RspDocumentColor            m) -> response m
    (RspColorPresentation        m) -> response m
    (RspFoldingRange             m) -> response m
    (RspCustomServer             m) -> response m
    (NotPublishDiagnostics       m) -> notification m
    (NotLogMessage               m) -> notification m
    (NotShowMessage              m) -> notification m
    (NotWorkDoneProgressBegin    m) -> notification m
    (NotWorkDoneProgressReport   m) -> notification m
    (NotWorkDoneProgressEnd      m) -> notification m
    (NotTelemetry                m) -> notification m
    (NotCancelRequestFromServer  m) -> notification m
    (NotCustomServer             m) -> notification m

handleClientMessage
    :: forall a.
       (forall b c . (ToJSON b, ToJSON c) => RequestMessage ClientMethod b c -> a)
    -> (forall d . ToJSON d => ResponseMessage d -> a)
    -> (forall e . ToJSON e => NotificationMessage ClientMethod e -> a)
    -> FromClientMessage
    -> a
handleClientMessage request response notification msg = case msg of
 (ReqInitialize               m) -> request m
 (ReqShutdown                 m) -> request m
 (ReqHover                    m) -> request m
 (ReqCompletion               m) -> request m
 (ReqCompletionItemResolve    m) -> request m
 (ReqSignatureHelp            m) -> request m
 (ReqDefinition               m) -> request m
 (ReqFindReferences           m) -> request m
 (ReqDocumentHighlights       m) -> request m
 (ReqDocumentSymbols          m) -> request m
 (ReqWorkspaceSymbols         m) -> request m
 (ReqCodeAction               m) -> request m
 (ReqCodeLens                 m) -> request m
 (ReqCodeLensResolve          m) -> request m
 (ReqDocumentFormatting       m) -> request m
 (ReqDocumentRangeFormatting  m) -> request m
 (ReqDocumentOnTypeFormatting m) -> request m
 (ReqPrepareRename            m) -> request m
 (ReqRename                   m) -> request m
 (ReqExecuteCommand           m) -> request m
 (ReqDocumentLink             m) -> request m
 (ReqDocumentLinkResolve      m) -> request m
 (ReqWillSaveWaitUntil        m) -> request m
 (ReqImplementation           m) -> request m
 (ReqTypeDefinition           m) -> request m
 (ReqDocumentColor            m) -> request m
 (ReqColorPresentation        m) -> request m
 (ReqFoldingRange             m) -> request m
 (RspApplyWorkspaceEdit       m) -> response m
 (RspFromClient               m) -> response m
 (NotInitialized              m) -> notification m
 (NotExit                     m) -> notification m
 (NotCancelRequestFromClient  m) -> notification m
 (NotDidChangeConfiguration   m) -> notification m
 (NotDidOpenTextDocument      m) -> notification m
 (NotDidChangeTextDocument    m) -> notification m
 (NotDidCloseTextDocument     m) -> notification m
 (NotWillSaveTextDocument     m) -> notification m
 (NotDidSaveTextDocument      m) -> notification m
 (NotDidChangeWatchedFiles    m) -> notification m
 (NotDidChangeWorkspaceFolders m) -> notification m
 (NotWorkDoneProgressCancel    m) -> notification m
 (ReqCustomClient             m) -> request m
 (NotCustomClient             m) -> notification m
